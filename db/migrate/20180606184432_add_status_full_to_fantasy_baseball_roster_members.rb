class AddStatusFullToFantasyBaseballRosterMembers < ActiveRecord::Migration[5.1]
  def change
    add_column :fantasy_baseball_roster_members, :status_full, :string
  end
end
