class AddUpdatedPositionToUserFantasyBaseballRosterMember < ActiveRecord::Migration[5.1]
  def change
    add_column :fantasy_baseball_roster_members, :updated_position, :string
  end
end
