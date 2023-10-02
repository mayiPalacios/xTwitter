class AddInteractionColumn < ActiveRecord::Migration[7.0]
  def change
    add_column :tweets, :interaction_reference, :integer
  end
end
