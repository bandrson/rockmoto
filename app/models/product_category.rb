class ProductCategory < ApplicationRecord
  validates :name, presence: true

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "name", "updated_at"]
  end
end
