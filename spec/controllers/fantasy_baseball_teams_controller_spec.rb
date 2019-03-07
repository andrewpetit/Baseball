require 'rails_helper'

# rubocop:disable Metrics/BlockLength
RSpec.describe FantasyBaseballTeamsController, type: :controller do
  include_context 'devise_testing_setup'

  let(:roster_sort) { create :roster_sort }
  let(:update_type) { create :update_type }
  let!(:fantasy_baseball_team) { create(:fantasy_baseball_team, user: user, roster_sort: roster_sort) }
  let(:fantasy_baseball_roster) do
    create(:fantasy_baseball_roster, update_type: update_type, roster_sort: roster_sort, fantasy_baseball_team: fantasy_baseball_team)
  end

  let(:valid_attributes) do
    {
      league_key: '123.456.789',
      league_id: '456',
      team_id: '789',
      roster_sort_id: roster_sort.id,
      team_name: 'Test Team',
      league_name: 'Test League',
      is_active: true,
      auto_update: true,
      team_icon_url: '',
      season: '2017'
    }
  end

  let(:invalid_attributes) do
    {
      test: nil
    }
  end
  let(:valid_session) { {} }

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

    context 'with no teams' do
      let(:fantasy_baseball_team) { nil }

      it 'redirects to add teams' do
        sign_in user
        get :index, params: {}, session: valid_session
        expect(response).to redirect_to(add_fantasy_baseball_teams_path)
      end
    end
  end

  describe 'GET #show' do
    describe 'no update_id' do
      let(:team) { instance_double(FantasyBaseballTeam) }

      before do
        allow(FantasyBaseballTeam).to receive(:find_by_id).with(fantasy_baseball_team.id.to_s).and_return(team)
        allow(team).to receive(:current_roster).and_return([])
        # allow(team).to recevie(:fantasy_baseball_roster)
        # TODO: test for current roster shit
      end

      it 'returns a success response' do
        sign_in user
        get :show, params: { id: fantasy_baseball_team.to_param }, session: valid_session
        expect(response).to be_success
      end

      it 'calls current_roster' do
        sign_in user
        get :show, params: { id: fantasy_baseball_team.to_param }, session: valid_session
        expect(team).to have_received(:current_roster)
      end

      it 'restricts access' do
        get :show, params: { id: fantasy_baseball_team.to_param }, session: valid_session
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    describe 'with update_id' do
      it 'returns a success response' do
        sign_in user
        get :show, params: { id: fantasy_baseball_team.to_param, update_id: fantasy_baseball_roster.id }, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe 'GET #new' do
    let(:teams_api) { Api::YahooTeam.new user.yahoo_access_token }

    before do
      allow(Api::YahooTeam).to receive(:new).and_return(teams_api)
      allow(teams_api).to receive(:user_teams).and_return({})
    end

    it 'returns a success response' do
      sign_in user
      get :new, params: {}, session: valid_session
      expect(response).to be_success
    end

    it 'restricts access' do
      get :new, params: {}, session: valid_session
      expect(response).to redirect_to(new_user_session_path)
    end
  end

  describe 'GET #edit' do
    it 'returns a success response' do
      sign_in user
      get :edit, params: { id: fantasy_baseball_team.to_param }, session: valid_session
      expect(response).to be_success
    end

    it 'restricts access' do
      get :edit, params: { id: fantasy_baseball_team.to_param }, session: valid_session
      expect(response).to redirect_to(new_user_session_path)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new FantasyBaseballTeam' do
        expect do
          sign_in user
          post :create, params: { fantasy_baseball_team: valid_attributes }, session: valid_session
        end.to change(FantasyBaseballTeam, :count).by(1)
      end

      it 'redirects to the created fantasy_baseball_team' do
        sign_in user
        post :create, params: { fantasy_baseball_team: valid_attributes }, session: valid_session
        expect(response).to redirect_to(FantasyBaseballTeam.last)
      end

      it 'restricts access' do
        post :create, params: { fantasy_baseball_team: valid_attributes }, session: valid_session
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context 'with invalid params' do
      it "returns a success response (i.e. to display the 'new' template)" do
        sign_in user
        post :create, params: { fantasy_baseball_team: invalid_attributes }, session: valid_session
        expect(response).to have_http_status(200)
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      it 'updates the requested fantasy_baseball_team' do
        sign_in user
        put :update, params: { id: fantasy_baseball_team.to_param, fantasy_baseball_team: valid_attributes }, session: valid_session
        fantasy_baseball_team.reload
        expect(fantasy_baseball_team.league_key).to eq valid_attributes[:league_key]
        expect(fantasy_baseball_team.team_id).to eq valid_attributes[:team_id]
      end

      it 'redirects to the fantasy_baseball_team' do
        sign_in user
        put :update, params: { id: fantasy_baseball_team.to_param, fantasy_baseball_team: valid_attributes }, session: valid_session
        expect(response).to redirect_to(fantasy_baseball_team)
      end

      it 'restricts access' do
        put :update, params: { id: fantasy_baseball_team.to_param, fantasy_baseball_team: valid_attributes }, session: valid_session
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context 'with invalid params' do
      it "returns a success response (i.e. to display the 'edit' template)" do
        sign_in user
        put :update, params: { id: fantasy_baseball_team.to_param, fantasy_baseball_team: invalid_attributes }, session: valid_session
        expect(response).to have_http_status(302)
      end
    end
  end

  describe 'PUT #update_roster' do
    context 'with valid params' do
      let(:roster_update) { instance_double('Api::YahooRosterUpdate') }
      let!(:update_type) { create(:update_type, update_type: UpdateType::MANUAL) }

      before do
        allow(Api::YahooRosterUpdate).to receive(:new).and_return(roster_update)
        allow(roster_update).to receive(:update_roster).and_return(true)
      end

      it 'updates the requested fantasy_baseball_team' do
        sign_in user
        put :update_roster, params: { id: fantasy_baseball_team.to_param, fantasy_baseball_team: valid_attributes }, session: valid_session
        expect(roster_update).to have_received(:update_roster).with(update_type)
      end

      it 'redirects to the fantasy_baseball_team' do
        sign_in user
        put :update_roster, params: { id: fantasy_baseball_team.to_param, fantasy_baseball_team: valid_attributes }, session: valid_session
        expect(response).to redirect_to(fantasy_baseball_team)
      end

      it 'restricts access' do
        put :update_roster, params: { id: fantasy_baseball_team.to_param, fantasy_baseball_team: valid_attributes }, session: valid_session
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested fantasy_baseball_team' do
      fantasy_baseball_team.save
      sign_in user
      expect do
        delete :destroy, params: { id: fantasy_baseball_team.to_param }, session: valid_session
      end.to change(FantasyBaseballTeam, :count).by(-1)
    end

    it 'redirects to the fantasy_baseball_teams list' do
      sign_in user
      delete :destroy, params: { id: fantasy_baseball_team.to_param }, session: valid_session
      expect(response).to redirect_to(fantasy_baseball_teams_url)
    end

    it 'restricts access' do
      delete :destroy, params: { id: fantasy_baseball_team.to_param }, session: valid_session
      expect(response).to redirect_to(new_user_session_path)
    end
  end
end
# rubocop:enable Metrics/BlockLength
