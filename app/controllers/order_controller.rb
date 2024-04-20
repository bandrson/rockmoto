class OrderController < ApplicationController
  def index
    unless current_customer
      redirect_to customer_session_path
      return
    end

    @orders = Order.where(customer: current_customer).sort_by(&:created_at).reverse
  end
end
