class AddAuthors < ActiveRecord::Migration[5.2]
  def change
    add_column :questions, :author, :string
    add_column :answers, :author, :string
  end
end
