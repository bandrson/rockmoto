class ProductFitment < ApplicationRecord
  belongs_to :product
  belongs_to :vehicle
end
