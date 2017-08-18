class CreateFantasyBaseballTeams < ActiveRecord::Migration[5.1]
  def change
    create_table :fantasy_baseball_teams do |t|
      t.references :user, foreign_key: true
      t.string :league_key
      t.string :league_id
      t.string :team_id
      t.integer :roster_sort_id
      t.string :team_name
      t.string :league_name
      t.boolean :is_active
      t.boolean :auto_update
      t.string :team_icon_url

      t.timestamps
    end
  end
end
