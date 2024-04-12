class VehicleMake < ApplicationRecord
  has_many :vehicles
  has_many :vehicle_years, through: :vehicles

  validates :name, presence: true

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "name", "updated_at"]
  end
end
