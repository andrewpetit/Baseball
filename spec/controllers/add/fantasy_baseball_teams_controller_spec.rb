require 'rails_helper'

RSpec.describe Add::FantasyBaseballTeamsController, type: :controller do
  include_context 'devise_testing_setup'
  let(:valid_session) { {} }
  let(:yahoo_access_token) { build :yahoo_access_token, user: user }

  before do
    allow(controller).to receive(:current_user).and_return(user)
    allow(user).to receive(:yahoo_auth?).and_return(true)
    allow(YahooAccessToken.oauth_client.auth_code).to receive(:get_token).and_return(yahoo_access_token)
    allow(user.yahoo_access_token).to receive(:access_token_set).and_return(true)
    allow(user).to receive(:unadded_teams).and_return([])
  end

  describe 'GET #index' do
    it 'returns a success response' do
      sign_in user
      get :index, params: {}, session: valid_session
      expect(response).to be_success
    end

    it 'restricts access' do
      get :index, params: {}, session: valid_session
      expect(response).to redirect_to(new_user_session_path)
    end
  end

  describe 'GET #auth_account' do
    let(:auth_url) { YahooAccessToken.auth_url junk }

    it 'redirects to yahoo auth' do
      sign_in user
      get :auth_account, params: {}, session: valid_session
      expect(response.status).to eq(302)
      expect(response).to redirect_to(auth_url)
    end

    it 'restricts access' do
      get :index, params: {}, session: valid_session
      expect(response).to redirect_to(new_user_session_path)
    end
  end

  describe 'GET #set_acccess_token' do
    describe 'valid response' do
      it 'redirects to add team' do
        sign_in user
        post :set_access_token, params: { code: junk }, session: valid_session
        expect(response).to redirect_to(add_fantasy_baseball_teams_path)
      end

      it 'sets access token' do
        sign_in user
        post :set_access_token, params: { code: junk }, session: valid_session
        expect(user.yahoo_access_token).to have_received(:access_token_set)
      end

      it 'restricts access' do
        get :index, params: {}, session: valid_session
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    describe 'invalid response' do
      before do
        allow(user.yahoo_access_token).to receive(:access_token_set).and_return(nil)
      end

      it 'redirects to add team' do
        sign_in user
        post :set_access_token, params: { code: junk }, session: valid_session
        expect(response).to redirect_to(add_fantasy_baseball_teams_path)
      end
    end
  end
end
