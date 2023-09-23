class AddcolumnInTagandHashtag < ActiveRecord::Migration[7.0]
  def change
    add_column :tags, :hashtag_id, :integer
    add_column :tags, :tweet_id, :integer
    add_foreign_key :tags, :tweets, column: :tweet_id
    add_foreign_key :tags, :hashtags, column: :hashtag_id
  end
end
