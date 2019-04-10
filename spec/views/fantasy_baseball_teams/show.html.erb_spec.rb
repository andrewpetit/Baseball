# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'fantasy_baseball_teams/show', type: :view do
  include_context 'devise_testing_setup'
  let(:roster_sort) { create :roster_sort }
  let(:fantasy_baseball_team) { create :fantasy_baseball_team, user: user, roster_sort: roster_sort }

  before do
    allow(controller).to receive(:current_user).and_return(user)
    allow(fantasy_baseball_team).to receive(:current_roster).and_return([]) # TODO: test for current roster shit
    assign(:fantasy_baseball_team, fantasy_baseball_team)
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/League Key/)
    expect(rendered).to match(/Roster Sort/)
  end
end
