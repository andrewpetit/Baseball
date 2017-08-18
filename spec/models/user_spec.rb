require 'rails_helper'

# rubocop:disable NestedGroups
RSpec.describe User, type: :model do
  let(:user) do
    create :user,
           yahoo_access_token: yahoo_access_token,
           fantasy_baseball_team: [fantasy_baseball_team]
  end
  let(:yahoo_access_token) { build :yahoo_access_token }
  let(:user_team_active) { true }
  let(:fantasy_baseball_team) { build :fantasy_baseball_team, roster_sort: roster_sort, is_active: user_team_active }
  let(:roster_sort) { create :roster_sort }

  describe '#yahoo_auth?' do
    context 'with no token' do
      let(:yahoo_access_token) { nil }

      it 'returns false' do
        expect(user).not_to be_yahoo_auth
      end
    end

    context 'with token' do
      it 'returns true' do
        expect(user).to be_yahoo_auth
      end
    end
  end

  describe '#unadded_teams' do
    context 'with no auth' do
      let(:yahoo_access_token) { nil }

      it 'returns empty hash' do
        expect(user.unadded_teams).to eq({})
      end
    end

    context 'with auth' do
      let(:team1) { fantasy_baseball_team }
      let(:team2) { build :fantasy_baseball_team, league_key: junk }
      let(:api_teams) { [team1, team2] }
      let(:teams_api) { instance_double(Api::YahooTeam) }

      before do
        allow(Api::YahooTeam).to receive(:new).and_return(teams_api)
        allow(teams_api).to receive(:user_teams).and_return(api_teams)
      end

      it 'returns unadded teams only' do
        expect(user.unadded_teams.size).to eq 1
        expect(user.unadded_teams).not_to include team1
      end
    end
  end

  describe '#team_from_yahoo' do
    context 'with no auth' do
      let(:yahoo_access_token) { nil }

      it 'returns empty hash' do
        expect(user.unadded_teams).to eq({})
      end
    end

    context 'with auth' do
      let(:yahoo_id) { 'testid' }
      let(:team1) { build :fantasy_baseball_team, league_key: junk }
      let(:team2) { build :fantasy_baseball_team, league_key: yahoo_id }
      let(:api_teams) { [team1, team2] }
      let(:teams_api) { instance_double(Api::YahooTeam) }

      before do
        allow(Api::YahooTeam).to receive(:new).and_return(teams_api)
        allow(teams_api).to receive(:user_teams).and_return(api_teams)
      end

      it 'returns unadded teams only' do
        expect(user.team_from_yahoo(yahoo_id).league_key).to eq yahoo_id
      end
    end
  end

  describe '#deactive_leagues' do
    context 'with no auth' do
      let(:yahoo_access_token) { nil }

      it 'returns nil' do
        expect(user.deactivate_leagues).to be_nil
      end
    end

    context 'with auth' do
      let(:is_active) { true }
      let(:team1) { build :fantasy_baseball_team, roster_sort: roster_sort, is_active: is_active }
      let(:team2) { build :fantasy_baseball_team, league_key: junk }
      let(:api_teams) { [team1, team2] }
      let(:teams_api) { instance_double(Api::YahooTeam) }

      before do
        allow(Api::YahooTeam).to receive(:new).and_return(teams_api)
        allow(teams_api).to receive(:user_teams).and_return(api_teams)
      end

      context 'with inactive team' do
        let(:user_team_active) { false }

        it 'does not update' do
          expect(user.deactivate_leagues).to be_nil
        end
      end

      context 'with inactive team' do
        let(:is_active) { false }

        before do
          user.deactivate_leagues
        end
        it 'updates' do
          expect(user.deactivate_leagues).to be_truthy
          expect(team1.is_active).to be_falsy
        end
      end

      context 'with nil team' do
        let(:user_team_active) { nil }
        let(:is_active) { true }

        before do
          user.deactivate_leagues
        end
        it 'updates' do
          expect(user.deactivate_leagues).to be_truthy
          expect(team1.is_active).to be_truthy
        end
      end
    end
  end
end
# rubocop:enable NestedGroups
