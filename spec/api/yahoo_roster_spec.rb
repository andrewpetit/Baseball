require 'rails_helper'
require 'xmlsimple'

RSpec.describe Api::YahooRoster, type: :class do
  include_context 'yahoo_roster_response_stubs'
  let(:yahoo_roster) { described_class.new(junk, junk, junk) }

  describe '#current_roster_members' do
    let(:roster_members) { yahoo_roster.current_roster_members }
    let(:roster_member) { roster_members.first }

    context 'with valid response' do
      before do
        allow(yahoo_roster).to receive(:parse_yahoo_response).and_return(roster_response)
      end

      it 'calls parse response' do
        roster_members
        expect(yahoo_roster).to have_received(:parse_yahoo_response)
      end

      it 'gives teams roster' do
        expect(roster_members.count).to eq 25
        expect(roster_members.first).to be_a(FantasyBaseballRosterMember)
        expect(roster_members.last).to be_a(FantasyBaseballRosterMember)
      end

      # rubocop:disable ExampleLength
      # rubocop:disable MultipleExpectations
      it 'populates properties' do
        expect(roster_member.headshot_url).not_to be nil
        expect(roster_member.image_url).not_to be nil
        expect(roster_member.first_name).to eq 'Jonathan'
        expect(roster_member.last_name).to eq 'Lucroy'
        expect(roster_member.external_id).to eq '8609'
        expect(roster_member.eligible_positions).to eq 'C,1B,Util,NA'
        expect(roster_member.selected_position).to eq 'C'
        expect(roster_member.display_position).to eq 'C,1B'
        expect(roster_member.uniform_number).to eq '21'
        expect(roster_member.position_type).to eq 'B'
        expect(roster_member.is_undroppable).to eq false
        expect(roster_member.editorial_player_key).to eq 'mlb.p.8609'
        expect(roster_member.editorial_team_key).to eq 'mlb.t.27'
        expect(roster_member.editorial_team_full_name).to eq 'Colorado Rockies'
        expect(roster_member.editorial_team_abbr).to eq 'Col'
        expect(roster_member.status_full).to eq 'Not Active'
      end
      # rubocop:enable ExampleLength
      # rubocop:enable MultipleExpectations

      # rubocop:disable NestedGroups
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
