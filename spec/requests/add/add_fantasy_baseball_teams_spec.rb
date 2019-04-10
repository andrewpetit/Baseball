# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Add::FantasyBaseballTeams', type: :request do
  describe 'GET /add_fantasy_baseball_teams' do
    it 'works! (now write some real specs)' do
      get add_fantasy_baseball_teams_path
      expect(response).to have_http_status(302)
    end
  end
end
