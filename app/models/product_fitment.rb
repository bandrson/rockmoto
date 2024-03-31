class ProductFitment < ApplicationRecord
  belongs_to :product
  belongs_to :vehicle

  validates :product, presence: true
  validates :vehicle, presence: true
end
