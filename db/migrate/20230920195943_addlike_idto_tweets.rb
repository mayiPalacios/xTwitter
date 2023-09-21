class AddlikeIdtoTweets < ActiveRecord::Migration[7.0]
  def change
    add_column :tweets, :like_id, :integer
    add_foreign_key :tweets, :likes
  end
end
