class Question < ApplicationRecord
  has_many :answers
  has_many :question_upvotes
  belongs_to :user

  def upvotes_count
    question_upvotes.count
  end

  def upvoted_by?(user)
    question_upvotes.find_by(user: user)
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
