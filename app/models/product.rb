class Product < ApplicationRecord
  validates_numericality_of :price
  validates :stock, numericality:{only_integer: true, greater_than: 0}
  has_many :carts
end
