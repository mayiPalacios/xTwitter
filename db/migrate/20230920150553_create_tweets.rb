class CreateTweets < ActiveRecord::Migration[7.0]
  def change
    create_table :tweets do |t|
      t.text :body
      t.belongs_to :user, null: false, foreign_key: true
      t.has_many :likes, null: false, foreign_key: true
      t.boolean :quote
      t.boolean :retweet

      t.timestamps
    end
  end
end
