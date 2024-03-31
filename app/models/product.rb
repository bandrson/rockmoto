class Product < ApplicationRecord
  belongs_to :product_brand
  belongs_to :product_category

  validates :product_brand, presence: true
  validates :product_category, presence: true
  validates :product_number, presence: true
  validates :description, presence: true
  validates :price,
            presence: true,
            numericality: { greater_than_or_equal_to: 0 }
end
