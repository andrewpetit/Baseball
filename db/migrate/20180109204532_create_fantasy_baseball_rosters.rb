class CreateFantasyBaseballRosters < ActiveRecord::Migration[5.1]
  def change
    create_table :fantasy_baseball_rosters do |t|
      t.references :fantasy_baseball_team, foreign_key: true

      t.timestamps
    end
  end
end
