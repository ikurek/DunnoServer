class ChangeAuthorsToUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :questions, :author
    remove_column :answers, :author

    add_column :questions, :user_id, :integer
    add_column :answers, :user_id, :integer
  end
end
