class Order < ApplicationRecord
  belongs_to :customer
  enum :status, %i[new paid shipped]

  validates :customer, presence: true
  validates :status, presence: true
  validates :gst_rate,
            allow_blank:  true,
            numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 1 }
  validates :pst_rate,
            allow_blank:  true,
            numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 1 }
  validates :hst_rate,
            allow_blank:  true,
            numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 1 }
end
