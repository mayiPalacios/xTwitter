class Tweets < ActiveRecord::Migration[7.0]
  def change
    create_table :tweets do |t|
     t.integer :user_id
     t.integer :user_likes_id
     t.boolean :quotes
     t.boolean :retweets
    end 
  end
end
