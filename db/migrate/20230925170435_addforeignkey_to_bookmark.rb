class AddforeignkeyToBookmark < ActiveRecord::Migration[7.0]
  def change
 
    add_column :bookmarks, :user_id, :integer
    add_column :bookmarks, :tweet_id, :integer
    add_foreign_key :bookmarks, :tweets, column: :tweet_id
    add_foreign_key :bookmarks, :users, column: :user_id

  end
end
