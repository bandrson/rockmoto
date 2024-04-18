class CheckoutController < ApplicationController
  before_action :initialize_session
  before_action :load_cart

  def index
    @customer = Customer.new
  end

  def totals
    @province = Province.find(params[:province] || 1)
    @subtotal = BigDecimal(0.00)
    @cart.each do |product_id, quantity|
      @subtotal += Product.find(product_id).price * quantity
    end

    @pst_total = @province.pst_rate? ? BigDecimal(@subtotal) * @province.pst_rate : BigDecimal(0.00)
    @gst_total = @province.gst_rate? ? BigDecimal(@subtotal) * @province.gst_rate : BigDecimal(0.00)
    @hst_total = @province.hst_rate? ? BigDecimal(@subtotal) * @province.hst_rate : BigDecimal(0.00)
    @total = @subtotal + @pst_total + @gst_total + @hst_total
  end

  def place_order
    # TODO: handle existing customers
    @customer = Customer.new(customer_params)

    if @customer.valid?
      @customer.save

      order = Order.new
      order.customer = @customer
      order.status = Order.statuses[:pending]
      order.gst_rate = customer.province.gst_rate
      order.pst_rate = customer.province.pst_rate
      order.hst_rate = customer.province.hst_rate
      order.save

      cart = session[:cart]
      cart.each do |product_id, quantity|
        product = Product.find(product_id)
        OrderItem.create(order_id: order.id, product:, price: product.price, quantity:)
      end

      session[:cart] = {}
      redirect_to checkout_success_path
    else
      render :index, status: :unprocessable_entity # Form validation failed
    end
  end

  private

  def initialize_session
    session[:cart] ||= {}
  end

  def load_cart
    @cart = session[:cart]
  end

  def customer_params
    params.require(:customer).permit(:full_name, :email, :phone_number, :street_address1,
                                     :street_address2, :city, :postal_code, :postal_code, :province_id)
  end
end
