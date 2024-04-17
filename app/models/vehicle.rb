class Vehicle < ApplicationRecord
  belongs_to :vehicle_year
  belongs_to :vehicle_make
  belongs_to :vehicle_model

  validates :vehicle_year, presence: true
  validates :vehicle_make, presence: true
  validates :vehicle_model, presence: true

  def self.ransackable_associations(_auth_object = nil)
    ["vehicle_year", "vehicle_make", "vehicle_model"]
  end

  def self.ransackable_attributes(_auth_object = nil)
    ["vehicle_year_id", "vehicle_make_id", "vehicle_model_id", "created_at", "updated_at"]
  end
end
