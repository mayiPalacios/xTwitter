class RemoveLikeIdFromTweets < ActiveRecord::Migration[7.0]
  def change
    remove_column :tweets, :like_id, :integer


  end
end
