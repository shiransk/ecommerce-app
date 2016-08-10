class Supplier < ApplicationRecord
  has_many :products

  validates :name, :email, :phone, presence: true
  validates :email, uniqueness: true
end



