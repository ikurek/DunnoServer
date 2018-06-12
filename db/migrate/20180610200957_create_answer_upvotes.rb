class CreateAnswerUpvotes < ActiveRecord::Migration[5.2]
  def change
    create_table :answer_upvotes do |t|
      t.integer :answer_id
      t.integer :user_id

      t.timestamps
    end
  end
end
