class User < ApplicationRecord
  has_secure_password

  enum :gender, %i[male female]

  validates :email, :gender, :first_name, :last_name, :password, presence: true
end
