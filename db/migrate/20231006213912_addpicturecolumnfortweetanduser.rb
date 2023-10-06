class Addpicturecolumnfortweetanduser < ActiveRecord::Migration[7.0]
  def change
    add_column :tweets, :photo_url, :string
    add_column :users, :photo_url, :string
  end
end
