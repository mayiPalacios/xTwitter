class Bookmarks < ActiveRecord::Migration[7.0]
  def change
    create_table :bookmarks do |b|
        b.integer :user_id
        b.integer :tweets_id
    end
  end
end
