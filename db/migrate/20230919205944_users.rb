class Users < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |u|
      u.string :username
      u.integer :follower  
      u.integer :follow
  end
end
end