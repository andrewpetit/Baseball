class AddProbablyStarterToFantasyBaseballRosterMember < ActiveRecord::Migration[5.1]
  def change
    add_column :fantasy_baseball_roster_members, :probable_starter, :boolean, :default => false
  end
end
