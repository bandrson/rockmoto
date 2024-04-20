class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_items, dependent: :destroy
  enum :status, %i[pending paid shipped delivered]

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

  def subtotal
    subtotal = BigDecimal(0.0)
    order_items.each do |order_item|
      subtotal += order_item.product.price * order_item.quantity
    end
    subtotal
  end

  def pst_total
    subtotal * pst_rate
  end

  def gst_total
    subtotal * gst_rate
  end

  def hst_total
    subtotal * hst_rate
  end

  def grand_total
    sub = subtotal
    pst_total = pst_rate? ? BigDecimal(sub) * pst_rate : BigDecimal(0.00)
    gst_total = gst_rate? ? BigDecimal(sub) * gst_rate : BigDecimal(0.00)
    hst_total = hst_rate? ? BigDecimal(sub) * hst_rate : BigDecimal(0.00)
    sub + pst_total + gst_total + hst_total
  end
end
