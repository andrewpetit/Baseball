class CreateRosterSorts < ActiveRecord::Migration[5.1]
  def change
    create_table :roster_sorts do |t|
      t.string :sort_type

      t.timestamps
    end
  end
end
