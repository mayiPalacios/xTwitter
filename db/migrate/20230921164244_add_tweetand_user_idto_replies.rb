class AddTweetandUserIdtoReplies < ActiveRecord::Migration[7.0]
  def change
    add_column :replies, :user_id, :integer
    add_column :replies, :tweet_id, :integer
    add_foreign_key :replies, :tweets, column: :tweet_id
    add_foreign_key :replies, :users, column: :user_id
  end
end
