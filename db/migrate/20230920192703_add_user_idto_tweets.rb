class AddUserIdtoTweets < ActiveRecord::Migration[7.0]
  def change
    add_column :tweets, :user_id, :integer
    add_foreign_key :tweets, :users
  end
end
