class Vehicle < ApplicationRecord
  belongs_to :vehicle_make
  belongs_to :vehicle_model

  validates :vehicle_make, presence: true
  validates :vehicle_model, presence: true
  validates :year,
            presence: true,
            numericality: { only_integer: true },
            length: { is: 4 } # a little bit of typo safety
end
