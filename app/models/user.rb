class User < ApplicationRecord
  has_secure_password

  enum :gender, %i[male female]

  has_many :links
  has_many :trackings

  validates :password, presence: true, on: :create
  validates :email, :gender, :first_name, :last_name, :dob, presence: true
  validates :email, uniqueness: true,
                    format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }

  def admin? = role == 'admin'
end
