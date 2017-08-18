class CreateFantasyBaseballRosterMembers < ActiveRecord::Migration[5.1]
  def change
    create_table :fantasy_baseball_roster_members do |t|
      t.references :fantasy_baseball_roster, foreign_key: true, index: { name: 'index_fantasy_roster_members_on_fantasy_roster_id' }
      t.string :headshot_url
      t.string :image_url
      t.string :first_name
      t.string :last_name
      t.string :external_id
      t.string :eligible_positions
      t.string :selected_position
      t.string :display_position
      t.string :uniform_number
      t.string :position_type
      t.boolean :is_undroppable
      t.string :editorial_player_key
      t.string :editorial_team_key
      t.string :editorial_team_full_name
      t.string :editorial_team_abbr

      t.timestamps
    end
  end
end
