require 'rails_helper'

RSpec.describe 'fantasy_baseball_teams/edit', type: :view do
  include_context 'devise_testing_setup'
  let(:roster_sort) { create :roster_sort }

  before do
    @fantasy_baseball_team = create(:fantasy_baseball_team, user: user, roster_sort: roster_sort)
  end

  it 'renders the edit fantasy_baseball_team form' do
    render
    assert_select 'form[action=?][method=?]', fantasy_baseball_team_path(@fantasy_baseball_team), 'post' do
    end
  end
end
