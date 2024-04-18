module CheckoutHelper
  def rate_to_percentage(rate)
    number_to_percentage(rate * 100, precision: 10, strip_insignificant_zeros: true)
  end
end
