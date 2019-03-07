class AddSeasonToFantasyBaseballTeams < ActiveRecord::Migration[5.1]
  def change
    add_column :fantasy_baseball_teams, :season, :string
  end
end
