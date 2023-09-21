class ChangenameColumnToFollower < ActiveRecord::Migration[7.0]
  def change
    remove_column :followers, :following_id
    remove_column :followers, :followee_id
    add_column :followers, :followee, :integer
    add_column :followers, :following, :integer
    add_foreign_key :followers, :users, column: :followee
    add_foreign_key :followers, :users, column: :following
  end
end
