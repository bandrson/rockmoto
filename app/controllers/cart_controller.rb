class CartController < ApplicationController
  before_action :initialize_session
  before_action :load_cart

  def add_to_cart
    id = params[:id]
    session[:cart][id] ||= 0

    quantity = params[:quantity].to_i || 1
    session[:cart][id] += quantity

    render "index"
  end

  def delete_from_cart
    id = params[:id]
    session[:cart].delete(id)

    render "index"
  end

  def update_cart_quantity
    id = params[:id]
    session[:cart][id] = params[:quantity].to_i
  end

  private

  def initialize_session
    session[:cart] ||= {}
  end

  def load_cart
    @cart = session[:cart]
  end
end
