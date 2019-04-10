# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::YahooRanks, type: :class do
  include_context 'yahoo_ranks_response_stubs'
  let(:yahoo_ranks) { described_class.new(junk, mlb_id, league_key, player_keys) }
  let(:player_keys) { ["#{mlb_id}.p.1234", "#{mlb_id}.p.1235"] }
  let(:mlb_id) { junk }
  let(:league_key) { junk }
  let(:ranks_url)  { "#{described_class::BASE_URL}/league/#{league_key}/players;player_keys=#{player_keys.join(',')}/ranks" }

  describe '#current_player_ranks' do
    let(:roster_members) { yahoo_ranks.current_player_ranks }
    let(:roster_member) { roster_members.first }

    context 'with valid response' do
      before do
        allow(yahoo_ranks).to receive(:raw_response).and_return(ranks_response)
      end

      it 'calls parse response' do
        roster_members
        expect(yahoo_ranks).to have_received(:raw_response).with(ranks_url)
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
        expect(roster_member.display_position).to eq 'C'
        expect(roster_member.uniform_number).to eq '9'
        expect(roster_member.position_type).to eq 'B'
        expect(roster_member.is_undroppable).to eq false
        expect(roster_member.editorial_player_key).to eq 'mlb.p.10959'
        expect(roster_member.editorial_team_key).to eq 'mlb.t.14'
        expect(roster_member.editorial_team_full_name).to eq 'Toronto Blue Jays'
        expect(roster_member.editorial_team_abbr).to eq 'Tor'
      end
      # rubocop:enable ExampleLength
      # rubocop:enable MultipleExpectations

      it 'populates season rank' do
        expect(roster_members.first.season_rank).to eq 608
        expect(roster_members.last.season_rank).to eq 94
      end

      it 'populates original rank' do
        expect(roster_members.first.original_rank).to eq 262
        expect(roster_members.last.original_rank).to eq 190
      end

      # rubocop:disable NestedGroups
      context 'with no roster' do
        let(:players) { [] }

        it 'returns empty array without error' do
          expect(roster_members).to eq []
        end
      end
      # rubocop:enable NestedGroups
    end
  end
end
