class AddRequestTokenToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :request_token, :string
  end
end
