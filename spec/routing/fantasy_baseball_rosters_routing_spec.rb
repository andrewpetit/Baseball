# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FantasyBaseballRostersController, type: :routing do
  describe 'routing' do
    let(:get_route) { '/fantasy_baseball_teams/1/fantasy_baseball_rosters' }

    it 'routes to #index' do
      expect(get: get_route).to route_to(controller: 'fantasy_baseball_rosters', action: 'index', fantasy_baseball_team_id: '1')
    end
  end
end
