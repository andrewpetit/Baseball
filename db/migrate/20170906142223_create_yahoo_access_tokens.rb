class CreateYahooAccessTokens < ActiveRecord::Migration[5.1]
  def change
    create_table :yahoo_access_tokens do |t|
      t.references :user, foreign_key: true
      t.string :access_token

      t.timestamps
    end
  end
end
