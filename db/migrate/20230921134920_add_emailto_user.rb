class AddEmailtoUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :email, :string
    add_column :users, :password, :string
    add_column :users, :username, :string
    add_column :users, :lastname, :string
  end
end
