# frozen_string_literal: true

require 'rails_helper'
require 'nokogiri'

RSpec.describe Api::YahooRosterUpdate, type: :class do
  include_context 'yahoo_roster_response_stubs'

  # rubocop:disable Metrics/LineLength
  let(:post_response_xml) do
    "<?xml version=\"1.0\" encoding=\"UTF-8\"?>
<fantasy_content xml:lang=\"en-US\" yahoo:uri=\"http://fantasysports.yahooapis.com/fantasy/v2/team/388.l.161732.t.11/roster\" xmlns:yahoo=\"http://www.yahooapis.com/v1/base.rng\" xmlns=\"http://fantasysports.yahooapis.com/fantasy/v2/base.rng\">
  <confirmation>
    <status>success</status>
  </confirmation>
</fantasy_content>
<!-- fanos1520.sports.bf1.yahoo.com Thu Apr  4 15:34:48 UTC 2019 -->"
  end
  # rubocop:enable Metrics/LineLength

  let(:roster_update) { described_class.new(fantasy_baseball_team, junk) }
  let(:roster_sort) { create :roster_sort }
  let(:update_type) { create :update_type }
  let(:user) { create :user }

  let(:fantasy_baseball_team) { create(:fantasy_baseball_team, user: user, roster_sort: roster_sort) }
  let(:yahoo_roster) { Api::YahooRoster.new(junk, junk, junk) }
  let(:roster_members) { yahoo_roster.current_roster_members }
  let(:roster_members_count) { roster_members.count }
  let(:mlb_id) { '370' }

  before do
    allow(yahoo_roster).to receive(:raw_response).and_return(roster_response)
    allow(fantasy_baseball_team).to receive(:sorted_roster).and_return(roster_members)
    roster_members.each { |p| p.updated_position = 'SS' }
  end

  describe '#update_xml' do
    it 'makes xml' do
      expect(Nokogiri::XML(roster_update.update_xml).errors).to be_empty
    end
  end

  describe '#update_roster' do
    before do
      allow(roster_update).to receive(:raw_put).and_return(post_response_xml)
      roster_update.update_roster(update_type)
    end

    it 'saves roster' do
      expect(fantasy_baseball_team.fantasy_baseball_roster.count).to eq 1
    end

    it 'saves roster members' do
      expect(fantasy_baseball_team.fantasy_baseball_roster.last.fantasy_baseball_roster_member.count).to eq roster_members_count
    end

    it 'posts the roster' do
      expect(roster_update).to have_received(:raw_put)
    end

    describe 'undrafted' do
      let(:roster_members) { [] }

      it 'does not process' do
        expect(roster_update).not_to have_received(:raw_put)
      end
    end
  end
end
