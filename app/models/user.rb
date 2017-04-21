class User < ApplicationRecord
  has_many :movies

  validates :email, :username, :password, presence: true

  has_secure_password
end
