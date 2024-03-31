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

  def self.ransackable_associations(auth_object = nil)
    ["product_brand", "product_category"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "description", "price", "product_brand_id", "product_category_id", "product_number", "updated_at"]
  end
end
