class BindUserToPost < ActiveRecord::Migration[5.2]
  def change
    add_reference :questions, :author, foreign_key: { to_table: :users }
  end
end
