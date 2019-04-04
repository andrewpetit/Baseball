require 'rails_helper'

RSpec.describe Api::YahooStats, type: :class do
  include_context 'yahoo_stats_response_stubs'
  let(:yahoo_stats) { described_class.new(junk, junk, junk, player_keys) }
  let(:player_keys) { ['mlb.p.1234', 'mlb.p.1235'] }

  describe '#current_player_stats' do
    let(:roster_members) { yahoo_stats.current_player_stats }
    let(:roster_member) { roster_members.first }
    let(:stats) do
      { '12' => '0', '13' => '0', '16' => '0', '3' => '.167', '60' => '2/12', '7' => '0' }
    end

    context 'with valid response' do
      before do
        allow(yahoo_stats).to receive(:raw_response).and_return(stats_response)
      end

      it 'calls parse response' do
        roster_members
        expect(yahoo_stats).to have_received(:raw_response)
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

      it 'populates stats' do
        expect(roster_member.player_stats).to eq stats
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
