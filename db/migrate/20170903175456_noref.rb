class Noref < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :refresh_token
  end
end
