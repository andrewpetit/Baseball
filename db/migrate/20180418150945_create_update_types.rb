class CreateUpdateTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :update_types do |t|
      t.string :update_type

      t.timestamps
    end
  end
end
