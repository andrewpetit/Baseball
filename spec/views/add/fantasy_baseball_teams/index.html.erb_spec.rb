# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'add/fantasy_baseball_teams/index', type: :view do
  include_context 'devise_testing_setup'
  let(:roster_sort) { create :roster_sort }
  let(:team1) { create :fantasy_baseball_team, user: user, roster_sort: roster_sort }
  let(:team2) { create :fantasy_baseball_team, user: user, roster_sort: roster_sort }
  let(:fantasy_baseball_teams) { [team1, team2] }
  let(:yahoo_auth) { true }

  before do
    allow(controller).to receive(:current_user).and_return(user)
    assign(:fantasy_baseball_teams, fantasy_baseball_teams)
    allow(user).to receive(:yahoo_auth?).and_return(yahoo_auth)
  end

  context 'when has teams' do
    it 'renders a list of add/fantasy_baseball_teams' do
      sign_in user
      render
      expect(rendered).to match(/League/)
      expect(rendered).to match(/Team/)
    end

    it 'renders must have yahoo auth' do
      allow(user).to receive(:yahoo_auth?).and_return(false)
      sign_in user
      render
      expect(rendered).to match(/You must authorize your yahoo account/)
    end
  end

  context 'when no teams' do
    let(:fantasy_baseball_teams) { [] }

    it 'renders handles no teams' do
      sign_in user
      render
      expect(rendered).to match(/There are no teams available to add to your account/)
    end
  end

  context 'when no yahoo auth' do
    let(:fantasy_baseball_teams) { nil }
    let(:yahoo_auth) { false }

    it 'renders handles no teams' do
      sign_in user
      render
      expect(rendered).to match(/You must authorize your yahoo account/)
    end
  end
end
