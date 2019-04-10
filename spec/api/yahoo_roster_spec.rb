# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::YahooRoster, type: :class do
  include_context 'yahoo_roster_response_stubs'
  let(:yahoo_access_token) { instance_double('YahooAccessToken') }
  let(:yahoo_roster) { described_class.new(yahoo_access_token, league_key, team_id) }
  let(:league_key) { junk }
  let(:team_id) { junk }
  let(:roster_url) { "#{described_class::BASE_URL}/team/#{league_key}.t.#{team_id}/roster/players" }

  describe '#current_roster_members' do
    let(:roster_members) { yahoo_roster.current_roster_members }
    let(:roster_member) { roster_members.first }

    context 'with valid response' do
      before do
        allow(yahoo_roster).to receive(:raw_response).and_return(roster_response)
      end

      it 'calls parse response' do
        roster_members
        expect(yahoo_roster).to have_received(:raw_response).with(roster_url)
      end

      it 'gives teams roster' do
        expect(roster_members.count).to eq 23
        expect(roster_members.first).to be_a(FantasyBaseballRosterMember)
        expect(roster_members.last).to be_a(FantasyBaseballRosterMember)
      end

      # rubocop:disable ExampleLength
      # rubocop:disable MultipleExpectations
      it 'populates properties' do
        expect(roster_member.headshot_url).not_to be nil
        expect(roster_member.image_url).not_to be nil
        expect(roster_member.first_name).to eq 'Danny'
        expect(roster_member.last_name).to eq 'Jansen'
        expect(roster_member.external_id).to eq '10959'
        expect(roster_member.eligible_positions).to eq 'C,Util'
        expect(roster_member.selected_position).to eq 'C'
        expect(roster_member.display_position).to eq 'C'
        expect(roster_member.uniform_number).to eq '9'
        expect(roster_member.position_type).to eq 'B'
        expect(roster_member.is_undroppable).to eq false
        expect(roster_member.editorial_player_key).to eq 'mlb.p.10959'
        expect(roster_member.editorial_team_key).to eq 'mlb.t.14'
        expect(roster_member.editorial_team_full_name).to eq 'Toronto Blue Jays'
        expect(roster_member.editorial_team_abbr).to eq 'Tor'
        expect(roster_member.status_full).to eq ''
        expect(roster_member.probable_starter).to eq false
      end
      # rubocop:enable ExampleLength
      # rubocop:enable MultipleExpectations

      it 'does not get ranks' do
        expect(roster_member.season_rank).to be_nil
        expect(roster_member.original_rank).to be_nil
      end

      # rubocop:disable NestedGroups
      context 'when probable starter' do
        let(:probable_starter) { roster_members.any? { |m| m.probable_starter == true } }

        it 'populates' do
          expect(probable_starter).to be_truthy
        end
      end

      context 'with no roster' do
        let(:roster) { [] }

        it 'returns empty array without error' do
          expect(roster_members).to eq []
        end
      end
      # rubocop:enable NestedGroups
    end
  end
end
