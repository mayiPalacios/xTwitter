class CreateTweets < ActiveRecord::Migration[7.0]
  def change
    create_table :tweets do |t|
      t.text :body
      t.boolean :quote
      t.boolean :retweet

      t.timestamps
    end
  end
end
