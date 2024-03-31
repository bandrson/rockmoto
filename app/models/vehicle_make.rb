class VehicleMake < ApplicationRecord
  validates :name, presence: true
end
