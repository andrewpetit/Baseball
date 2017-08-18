require 'rails_helper'

RSpec.describe FantasyBaseballTeamsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/fantasy_baseball_teams').to route_to('fantasy_baseball_teams#index')
    end

    it 'routes to #new' do
      expect(get: '/fantasy_baseball_teams/new').to route_to('fantasy_baseball_teams#new')
    end

    it 'routes to #show' do
      expect(get: '/fantasy_baseball_teams/1').to route_to('fantasy_baseball_teams#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/fantasy_baseball_teams/1/edit').to route_to('fantasy_baseball_teams#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/fantasy_baseball_teams').to route_to('fantasy_baseball_teams#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/fantasy_baseball_teams/1').to route_to('fantasy_baseball_teams#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/fantasy_baseball_teams/1').to route_to('fantasy_baseball_teams#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/fantasy_baseball_teams/1').to route_to('fantasy_baseball_teams#destroy', id: '1')
    end
  end
end
