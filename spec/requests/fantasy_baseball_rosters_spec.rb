require 'rails_helper'

RSpec.describe 'FantasyBaseballRosters', type: :request do
  describe 'GET /fantasy_baseball_rosters' do
    it 'works! (now write some real specs)' do
      get fantasy_baseball_team_fantasy_baseball_rosters_path(fantasy_baseball_team_id: 1)
      expect(response).to have_http_status(302)
    end
  end
end
