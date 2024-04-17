class VehicleYear < ApplicationRecord
  has_many :vehicles, dependent: :destroy

  validates :year,
            presence:     true,
            numericality: { only_integer: true },
            length:       { is: 4 } # a little bit of typo safety

  def self.ransackable_attributes(_auth_object = nil)
    ["created_at", "year", "updated_at"]
  end
end
