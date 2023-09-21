class RemovetweetsIdcolumninLike < ActiveRecord::Migration[7.0]
  def change
    remove_column :likes, :tweets_id
    add_column :likes, :tweet_id, :integer
    add_foreign_key :likes, :tweets, column: :tweet_id
 
  end
end
