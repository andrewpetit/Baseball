require 'rails_helper'

RSpec.describe Api::YahooTeam, type: :class do
  include_context 'yahoo_base_response_stubs'
  let(:yahoo_team) { described_class.new(junk) }

  before do
    allow(yahoo_team).to receive(:raw_response)
      .with(described_class::MLB_ID_URL)
      .and_return(valid_mlb_id_response)
    allow(yahoo_team).to receive(:raw_response)
      .with(described_class::AVAILABLE_TEAMS_URL)
      .and_return(valid_teams_response)
    allow(yahoo_team).to receive(:raw_response)
      .with(described_class::AVAILABLE_LEAGUES_URL + '268.l.78659,268.l.57939')
      .and_return(leagues_response)
  end

  describe '#user_teams' do
    context 'with valid response' do
      it 'gives users teams' do
        expect(yahoo_team.user_teams.count).to eq 2
        expect(yahoo_team.user_teams.first).to be_a(FantasyBaseballTeam)
        expect(yahoo_team.user_teams.last).to be_a(FantasyBaseballTeam)
        expect(yahoo_team.user_teams.first.league_key).to eq valid_user_teams.first.league_key
        expect(yahoo_team.user_teams.last.league_key).to eq valid_user_teams.last.league_key
      end
    end

    it 'sets is_active' do
      expect(yahoo_team.user_teams.first.is_active).not_to be_nil
      expect(yahoo_team.user_teams.last.is_active).not_to be_nil
    end

    it 'calls parse response for mlb_id' do
      yahoo_team.user_teams
      expect(yahoo_team).to have_received(:raw_response).with(described_class::MLB_ID_URL)
    end

    it 'calls parse response for teams' do
      yahoo_team.user_teams
      expect(yahoo_team).to have_received(:raw_response)
        .with(described_class::AVAILABLE_TEAMS_URL)
    end

    it 'calls parse response for leagues' do
      yahoo_team.user_teams
      expect(yahoo_team).to have_received(:raw_response)
        .with(described_class::AVAILABLE_LEAGUES_URL + '268.l.78659,268.l.57939')
    end

    describe 'invalid league key' do
      let(:team2) { unstarted_team }

      before do
        allow(yahoo_team).to receive(:raw_response)
          .with(described_class::AVAILABLE_LEAGUES_URL + '268.l.78659')
          .and_return(leagues_response)
      end

      it 'exludes invalid leagues' do
        yahoo_team.user_teams
        expect(yahoo_team).to have_received(:raw_response)
          .with(described_class::AVAILABLE_LEAGUES_URL + '268.l.78659')
      end
    end

    context 'with no teams available' do
      let(:team_count) { '0' }
      let(:team) { [] }

      it 'returns no teams without error' do
        expect(yahoo_team.user_teams).to eq []
      end
    end

    context 'with no games available' do
      let(:games_count) { '0' }
      let(:game) { [] }

      it 'returns no teams without error' do
        expect(yahoo_team.user_teams).to eq []
      end
    end
  end
end
