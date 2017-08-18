require 'rails_helper'

RSpec.describe 'fantasy_baseball_teams/index', type: :view do
  include_context 'devise_testing_setup'
  let(:roster_sort) { create :roster_sort }
  let(:team1) { create :fantasy_baseball_team, user: user, roster_sort: roster_sort }
  let(:team2) { create :fantasy_baseball_team, user: user, roster_sort: roster_sort }
  let(:fantasy_baseball_teams) { [team1, team2] }

  before do
    allow(controller).to receive(:current_user).and_return(user)
    assign(:fantasy_baseball_teams, fantasy_baseball_teams)
    allow(user).to receive(:yahoo_auth?).and_return(true)
  end

  context 'when has yahoo auth' do
    it 'renders a list of fantasy_baseball_teams' do
      sign_in user
      render
      expect(rendered).to match(/League/)
      expect(rendered).to match(/Team/)
    end

    context 'when no teams' do
      let(:fantasy_baseball_teams) { [] }

      it 'links to add teams' do
        sign_in user
        render
        expect(rendered).to match(/Your Teams/)
      end
    end
  end

  context 'when no yahoo auth' do
    it 'links to add teams' do
      allow(user).to receive(:yahoo_auth?).and_return(false)
      sign_in user
      render
      expect(rendered).to match(/Your Teams/)
    end
  end
end
