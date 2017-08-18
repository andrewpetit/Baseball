class AddDescriptionToSortTypes < ActiveRecord::Migration[5.1]
  def change
    add_column :roster_sorts, :description, :string
  end
end
