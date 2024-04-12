class ProductFitment < ApplicationRecord
  belongs_to :product
  belongs_to :vehicle

  validates :product, presence: true
  validates :vehicle, presence: true

  def self.ransackable_associations(auth_object = nil)
    ["product", "vehicle"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "product_id", "vehicle_id", "updated_at"]
  end
end
