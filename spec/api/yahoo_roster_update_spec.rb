require 'rails_helper'
require 'xmlsimple'
require 'nokogiri'

RSpec.describe Api::YahooRosterUpdate, type: :class do
  include_context 'yahoo_roster_response_stubs'

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
    allow(yahoo_roster).to receive(:parse_yahoo_response).and_return(roster_response)
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
      allow(roster_update).to receive(:post_and_parse_yahoo_response).and_return(nil)
      roster_update.update_roster(update_type)
    end

    it 'saves roster' do
      expect(fantasy_baseball_team.fantasy_baseball_roster.count).to eq 1
    end

    it 'saves roster members' do
      expect(fantasy_baseball_team.fantasy_baseball_roster.last.fantasy_baseball_roster_member.count).to eq roster_members_count
    end

    it 'posts the roster' do
      expect(roster_update).to have_received(:post_and_parse_yahoo_response)
    end
  end
end
