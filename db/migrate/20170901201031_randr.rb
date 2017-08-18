class Randr < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :session
    rename_column :users, :request_token, :refresh_token
  end
end
