class VehicleYear < ApplicationRecord
  validates :year,
            presence: true,
            numericality: { only_integer: true },
            length: { is: 4 } # a little bit of typo safety

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "year", "updated_at"]
  end
end
