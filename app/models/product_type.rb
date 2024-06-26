class ProductType < ApplicationRecord
  belongs_to :product_category

  validates :name, presence: true

  def self.ransackable_associations(_auth_object = nil)
    ["product_category"]
  end

  def self.ransackable_attributes(_auth_object = nil)
    ["created_at", "product_category_id", "name", "updated_at"]
  end
end
