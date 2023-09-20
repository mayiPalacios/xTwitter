class AddfollowsId < ActiveRecord::Migration[7.0]
  def change
    add_column :followers, :following_id, :integer
    add_column :followers, :followee_id, :integer
    add_foreign_key :followers, :users, column: :following_id
    add_foreign_key :followers, :users, column: :followee_id
  end
end
