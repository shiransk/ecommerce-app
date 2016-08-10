class CartedProduct < ApplicationRecord
  belongs_to :product
  belongs_to :order

  validates :quantity, numericality: {only_integer: true}
end
