class Product < ApplicationRecord
  belongs_to :product_brand
  belongs_to :product_type
  has_one_attached :image

  validates :product_brand, presence: true
  validates :product_type, presence: true
  validates :product_number, presence: true
  validates :name, presence: true
  validates :description,
            presence:    true,
            allow_blank: true
  validates :price,
            presence:     true,
            numericality: { greater_than_or_equal_to: 0 }
  validates :extended_data, presence: true

  def self.ransackable_associations(_auth_object = nil)
    ["product_brand", "product_category"]
  end

  def self.ransackable_attributes(_auth_object = nil)
    ["created_at", "name", "description", "price", "product_brand_id", "product_type_id",
     "product_number", "updated_at"]
  end
end
