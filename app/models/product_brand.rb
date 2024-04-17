class ProductBrand < ApplicationRecord
  validates :name, presence: true

  def self.ransackable_attributes(_auth_object = nil)
    ["created_at", "name", "updated_at"]
  end
end
