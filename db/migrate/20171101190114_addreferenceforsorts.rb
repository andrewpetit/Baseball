class Addreferenceforsorts < ActiveRecord::Migration[5.1]
  def change
    remove_column :fantasy_baseball_teams, :roster_sort_id, :integer
    add_column :fantasy_baseball_teams, :roster_sort_id, :integer, references: :roster_sorts
  end
end
