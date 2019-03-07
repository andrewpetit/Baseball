require 'rails_helper'

RSpec.describe 'fantasy_baseball_rosters/index', type: :view do
  include_context 'devise_testing_setup'
  let(:roster_sort) { create :roster_sort }
  let(:update_type) { create :update_type }
  let(:fantasy_baseball_team) { create :fantasy_baseball_team, user: user, roster_sort: roster_sort }
  let(:roster1) { create :fantasy_baseball_roster, fantasy_baseball_team: fantasy_baseball_team, roster_sort: roster_sort, update_type: update_type }
  let(:roster2) { create :fantasy_baseball_roster, fantasy_baseball_team: fantasy_baseball_team, roster_sort: roster_sort, update_type: update_type }

  before do
    assign(:fantasy_baseball_team, fantasy_baseball_team)
    assign(:fantasy_baseball_rosters, [roster1, roster2])
  end

  it 'renders a list of fantasy_baseball_rosters' do
    render
    expect(rendered).to match(roster1.update_type.update_type)
    expect(rendered).to match(roster2.roster_sort.description)
  end

  describe 'no rosters' do
    before do
      assign(:fantasy_baseball_rosters, [])
    end

    it 'displays message' do
      render
      expect(rendered).to match(/You don't have any changes/)
    end
  end
end
