class User < ApplicationRecord
    # Require safe password, validate email, etc.
    acts_as_authentic
    has_many :questions
end
