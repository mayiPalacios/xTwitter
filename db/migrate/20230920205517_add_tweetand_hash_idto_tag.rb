class AddTweetandHashIdtoTag < ActiveRecord::Migration[7.0]
  def change
    add_column :tags, :hashtag_id, :integer
    add_foreign_key :tags, :hashtags, column: :hashtag_id
  end
end
