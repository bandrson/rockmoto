class VehicleMake < ApplicationRecord
  has_many :vehicles, dependent: :destroy
  has_many :vehicle_years, through: :vehicles

  validates :name, presence: true

  def self.ransackable_attributes(_auth_object = nil)
    ["created_at", "name", "updated_at"]
  end
end
