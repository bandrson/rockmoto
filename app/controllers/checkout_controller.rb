class CheckoutController < ApplicationController
  before_action :initialize_session
  before_action :load_cart

  def index
    @customer = current_customer || Customer.new
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
    validated = current_customer ? handle_current_customer : handle_new_customer
    render :index, status: :unprocessable_entity and return unless validated

    create_order_from_cart(@customer)
    redirect_to checkout_success_path
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
                                     :street_address2, :city, :postal_code, :postal_code,
                                     :province_id)
  end

  def handle_current_customer
    @customer = current_customer
    @customer.update(customer_params) # true if success, false otherwise
  end

  def handle_new_customer
    @customer = Customer.new(customer_params)
    @customer.skip_password_validation = true
    @customer.save
  end

  def create_order_from_cart(cust)
    create_order_items(create_order(cust), session[:cart])
    session[:cart] = {}
  end

  def create_order(cust)
    Order.create!(customer: cust, status: Order.statuses[:pending],
                  gst_rate: cust.province.gst_rate,
                  pst_rate: cust.province.pst_rate,
                  hst_rate: cust.province.hst_rate)
  end

  def create_order_items(order, cart)
    cart.each do |product_id, quantity|
      product = Product.find(product_id)
      OrderItem.create(order_id: order.id, product:, price: product.price, quantity:)
    end
  end
end
