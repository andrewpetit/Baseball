class AddSortTypeToFantasyBasballRoster < ActiveRecord::Migration[5.1]
  def change
    add_column :fantasy_baseball_rosters, :roster_sort_id, :integer, references: :roster_sorts
    add_column :fantasy_baseball_rosters, :update_type_id, :integer, references: :update_types
  end
end
