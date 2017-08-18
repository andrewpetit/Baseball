require 'rails_helper'

RSpec.describe 'FantasyBaseballTeams', type: :request do
  describe 'GET /fantasy_baseball_teams' do
    it 'works! (now write some real specs)' do
      get fantasy_baseball_teams_path
      expect(response).to have_http_status(302)
    end
  end
end
