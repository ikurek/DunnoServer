class User < ApplicationRecord
  has_many :questions

  acts_as_authentic
end
