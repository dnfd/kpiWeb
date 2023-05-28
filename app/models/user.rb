class User < ApplicationRecord
  has_secure_password

  enum :gender, %i[male female]

  has_many :links
  has_many :trackings

  validates :email, :gender, :first_name, :last_name, :password, presence: true
  validates :email, uniqueness: true,
                    format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
end
