class CheckoutController < ApplicationController
  before_action :initialize_session
  before_action :load_cart

  def index
    @customer = Customer.new
  end

  def totals
    province = Province.find(params[:province] || 1)
    @subtotal = BigDecimal(0.00)
    @cart.each do |product_id, quantity|
      @subtotal += Product.find(product_id).price * quantity
    end

    @pst_total = province.pst_rate? ? BigDecimal(@subtotal) * province.pst_rate : BigDecimal(0.00)
    @gst_total = province.gst_rate? ? BigDecimal(@subtotal) * province.gst_rate : BigDecimal(0.00)
    @hst_total = province.hst_rate? ? BigDecimal(@subtotal) * province.hst_rate : BigDecimal(0.00)
    @total = @subtotal + @pst_total + @gst_total + @hst_total
  end

  private

  def initialize_session
    session[:cart] ||= {}
  end

  def load_cart
    @cart = session[:cart]
  end
end
