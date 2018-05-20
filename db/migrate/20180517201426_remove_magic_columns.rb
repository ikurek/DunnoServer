class RemoveMagicColumns < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :active
    remove_column :users, :approved
    remove_column :users, :confirmed
  end
end
