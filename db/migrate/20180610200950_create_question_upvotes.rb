class CreateQuestionUpvotes < ActiveRecord::Migration[5.2]
  def change
    create_table :question_upvotes do |t|
      t.integer :question_id
      t.integer :user_id

      t.timestamps
    end
  end
end
