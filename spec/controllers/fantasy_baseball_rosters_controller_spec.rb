# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FantasyBaseballRostersController, type: :controller do
  include_context 'devise_testing_setup'

  let(:roster_sort) { create :roster_sort }
  let(:fantasy_baseball_team) { create(:fantasy_baseball_team, user: user, roster_sort: roster_sort) }
  let(:fantasy_baseball_roster) { create(:fantasy_baseball_roster, fantasy_baseball_team: fantasy_baseball_team) }

  let(:valid_session) { {} }

  describe 'GET #index' do
    it 'returns a success response' do
      sign_in user
      get :index, params: { fantasy_baseball_team_id: fantasy_baseball_team.id }, session: valid_session
      expect(response).to be_success
    end

    it 'restricts access' do
      get :index, params: { fantasy_baseball_team_id: fantasy_baseball_team.id }, session: valid_session
      expect(response).to redirect_to(new_user_session_path)
    end

    context 'with no results' do
      it 'returns a success response' do
        sign_in user
        get :index, params: { fantasy_baseball_team_id: -1 }, session: valid_session
        expect(response).to be_success
      end
    end
  end
end
