# frozen_string_literal: true

require 'rails_helper'
require 'rake'

# rubocop:disable RSpec/DescribeClass
describe 'baseball namespace rake task' do
  describe 'baseball:optimize_active_lineups' do
    let(:user) { create :user }
    let(:roster_sort) { create :roster_sort }
    let(:update_type) { create :update_type }
    let(:fantasy_baseball_team1) { create(:fantasy_baseball_team, user: user, roster_sort: roster_sort, is_active: true) }
    let(:fantasy_baseball_team2) { create(:fantasy_baseball_team, user: user, roster_sort: roster_sort, is_active: false) }
    let(:fantasy_baseball_team3) { create(:fantasy_baseball_team, user: user, roster_sort: roster_sort, is_active: true, auto_update: false) }
    let(:teams) { [fantasy_baseball_team1, fantasy_baseball_team2, fantasy_baseball_team3] }

    let :run_rake_task do
      Rake::Task['baseball:optimize_active_lineups'].reenable
      Rake.application.invoke_task 'baseball:optimize_active_lineups'
    end

    before do
      Rake.application.rake_require 'tasks/baseball'
      Rake::Task.define_task(:environment)
      allow(FantasyBaseballTeam).to receive(:optimizable_leagues).and_return(teams)
      allow(fantasy_baseball_team1).to receive(:update_roster).with(update_type).and_return(nil)
      allow(fantasy_baseball_team2).to receive(:update_roster).with(update_type).and_return(nil)
      allow(fantasy_baseball_team3).to receive(:update_roster).with(update_type).and_return(nil)
      allow(User).to receive(:all).and_return([user])
      allow(user).to receive(:deactivate_leagues).and_return(nil)
      run_rake_task
    end

    it 'deactivates lineups' do
      expect(user).to have_received(:deactivate_leagues)
    end

    it 'optimize_active_lineups for active teams' do
      expect(fantasy_baseball_team1).to have_received(:update_roster).with(update_type)
      expect(fantasy_baseball_team2).to have_received(:update_roster).with(update_type)
      expect(fantasy_baseball_team3).to have_received(:update_roster).with(update_type)
    end
  end
end
# rubocop:enable RSpec/DescribeClass
