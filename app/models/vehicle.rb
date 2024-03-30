class Vehicle < ApplicationRecord
  belongs_to :vehicle_make
  belongs_to :vehicle_model
end
