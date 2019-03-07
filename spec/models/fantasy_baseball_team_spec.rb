require 'rails_helper'

RSpec.describe FantasyBaseballTeam, type: :model do
  let(:user) { create :user }
  let(:team) { described_class.new(args) }

  let(:league_key) { '123' }
  let(:league_id) { '456' }
  let(:team_id) { '789' }
  let(:mlb_id) { league_key }
  let(:args) do
    {
      'league_key' => league_key,
      'league_id' => league_id,
      'team_id' => team_id,
      'invalid' => 'test'
    }
  end

  before do
    user.fantasy_baseball_team.push(team)
  end

  describe '.optimizable_leagues' do
    let(:roster_sort) { create :roster_sort }
    let(:fantasy_baseball_team1) { create(:fantasy_baseball_team, user: user, roster_sort: roster_sort, is_active: true) }
    let(:fantasy_baseball_team2) { create(:fantasy_baseball_team, user: user, roster_sort: roster_sort, is_active: false) }
    let(:fantasy_baseball_team3) { create(:fantasy_baseball_team, user: user, roster_sort: roster_sort, is_active: true, auto_update: false) }

    it 'returns active and auto_update teams' do
      expect(FantasyBaseballTeam.optimizable_leagues).to eq [fantasy_baseball_team1]
    end
  end

  describe '.initialize' do
    it 'returns valid attributes' do
      expect(team.league_key).to eq league_key
      expect(team.league_id).to eq league_id
      expect(team.team_id).to eq team_id
    end
  end

  describe '#current_roster' do
    let(:yahoo_roster) { instance_double('Api::YahooRoster') }

    before do
      allow(Api::YahooRoster).to receive(:new).with(user.yahoo_access_token, league_key, team_id).and_return(yahoo_roster)
      allow(yahoo_roster).to receive(:current_roster_members).and_return(nil)
      team.current_roster
    end

    it 'calls current_roster_members' do
      expect(yahoo_roster).to have_received(:current_roster_members)
    end
  end

  describe '#current_ranks' do
    let(:yahoo_ranks) { instance_double('Api::YahooRanks') }
    let(:current_roster) { [] }

    before do
      allow(team).to receive(:current_roster).and_return(current_roster)
      allow(Api::YahooRanks).to receive(:new).with(user.yahoo_access_token, mlb_id, league_key, []).and_return(yahoo_ranks)
      allow(yahoo_ranks).to receive(:current_player_ranks).and_return(nil)
      team.current_ranks
    end

    it 'calls current_player_ranks' do
      expect(yahoo_ranks).to have_received(:current_player_ranks)
    end
  end

  describe '#current_stats' do
    let(:yahoo_stats) { instance_double('Api::YahooStats') }
    let(:current_roster) { [] }

    before do
      allow(team).to receive(:current_roster).and_return(current_roster)
      allow(Api::YahooStats).to receive(:new).with(user.yahoo_access_token, mlb_id, league_key, []).and_return(yahoo_stats)
      allow(yahoo_stats).to receive(:current_player_stats).and_return(nil)
      team.current_stats
    end

    it 'calls current_player_stats' do
      expect(yahoo_stats).to have_received(:current_player_stats)
    end
  end

  describe '#sorted_roster' do
    let(:roster_sorter) { instance_double('RosterSorter') }

    before do
      allow(RosterSorter).to receive(:new).with(team).and_return(roster_sorter)
      allow(roster_sorter).to receive(:sorted_roster).and_return(nil)
      team.sorted_roster
    end

    it 'calls sorted_roster' do
      expect(roster_sorter).to have_received(:sorted_roster)
    end
  end

  describe '#update_roster' do
    let(:roster_update) { instance_double('Api::YahooRosterUpdate') }
    let(:update_type) { junk }

    before do
      allow(Api::YahooRosterUpdate).to receive(:new).with(team, user.yahoo_access_token).and_return(roster_update)
      allow(roster_update).to receive(:update_roster).with(update_type).and_return(nil)
      team.update_roster update_type
    end

    it 'calls update_roster' do
      expect(roster_update).to have_received(:update_roster).with(update_type)
    end
  end
end
