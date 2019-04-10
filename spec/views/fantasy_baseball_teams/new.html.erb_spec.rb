# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'fantasy_baseball_teams/new', type: :view do
  before do
    assign(:fantasy_baseball_team, FantasyBaseballTeam.new)
  end

  it 'renders new fantasy_baseball_team form' do
    render

    assert_select 'form[action=?][method=?]', fantasy_baseball_teams_path, 'post' do
    end
  end
end
