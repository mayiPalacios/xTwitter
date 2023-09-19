class UserLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :userLikes do |l|
       l.integer :user_id
       l.integer :tweets_id
    end
  end
end
