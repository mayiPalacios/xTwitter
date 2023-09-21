class AddUserTweetsIdtoLike < ActiveRecord::Migration[7.0]
  def change
    add_column :likes, :user_id, :integer
    add_column :likes, :tweets_id, :integer
    add_foreign_key :likes, :tweets, column: :tweets_id
    add_foreign_key :likes, :users, column: :user_id
  end
end
