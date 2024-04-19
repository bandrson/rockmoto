class CatalogController < ApplicationController
  def index
    @makes = VehicleMake.all.order(:name)
  end

  def show_years
    @make = VehicleMake.where(name: params[:make]).first
    @years = @make.vehicle_years.all.order(:year)
  end

  def show_models
    @make = VehicleMake.where(name: params[:make]).first
    @year = VehicleYear.where(year: params[:year]).first
    @models = Vehicle.where(vehicle_make: @make, vehicle_year: @year).includes(:vehicle_model)
  end

  def show_categories
    @vehicle = Vehicle.find(params[:vehicle_id])
    fitments = ProductFitment.where(vehicle: @vehicle).includes(:product)
    @cats = []
    fitments.each do |fitment|
      @cats.append(fitment.product.product_type.product_category)
    end
    @cats = @cats.uniq
  end

  def show_types
    @vehicle = Vehicle.find(params[:vehicle_id])
    @category = ProductCategory.find(params[:product_category_id])
    fitments = ProductFitment.where(vehicle: @vehicle).includes(:product)
    @types = []
    fitments.each do |fitment|
      type = fitment.product.product_type
      @types.append(type) if type.product_category == @category
    end
    @types = @types.uniq
  end

  def show_products
    @vehicle = Vehicle.find(params[:vehicle_id])
    @type = ProductType.find(params[:product_type_id])
    fitments = ProductFitment.where(vehicle: @vehicle).includes(:product)
    @products = []
    fitments.each do |fitment|
      product = fitment.product
      @products.append(product) if product.product_type == @type
    end
    @products = @products.sort_by(&:price)
  end

  def search
    if params[:category].blank?
      @types = ProductType.all
    else
      @category = ProductCategory.find(params[:category])
      @types = ProductType.where(product_category: @category)
    end
    @filtered_types = @types.where("LOWER(name) LIKE ? OR LOWER(description) LIKE ?",
                                   "%#{params[:query].downcase}%", "%#{params[:query].downcase}%")
    @products = Product.where(product_type: @filtered_types)
  end
end
