class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :user

  has_many :answer_upvotes

  def upvotes_count
    answer_upvotes.count
  end

  def upvoted_by?(user)
    answer_upvotes.find_by(user: user)
  end

  def as_json(options={})
    super.as_json(options).merge({user_login: get_user_login}).merge({score: get_question_score})
  end

  def get_user_login
    self.user && self.user.login
  end

  def get_question_score
    self.upvotes_count
  end
end
