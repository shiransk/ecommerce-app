class User < ApplicationRecord
  has_secure_password
  has_many :orders

  validates :name,:email, presence: true
  validates :password, length: {in: 6..10}
  validates :email, uniqueness: true
end
