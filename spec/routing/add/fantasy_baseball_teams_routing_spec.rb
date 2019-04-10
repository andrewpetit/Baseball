# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Add::FantasyBaseballTeamsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/add/fantasy_baseball_teams').to route_to('add/fantasy_baseball_teams#index')
    end
  end
end
