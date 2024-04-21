if Rails.env.development?
  AdminUser.create!(email: "admin@example.com", password: "password",
                    password_confirmation: "password")
end

# Provinces
Province.create!(name: "British Columbia", pst_rate: 0.07, gst_rate: 0.05)
Province.create!(name: "Alberta", gst_rate: 0.05)
Province.create!(name: "Saskatchewan", pst_rate: 0.06, gst_rate: 0.05)
Province.create!(name: "Manitoba", pst_rate: 0.07, gst_rate: 0.05)
Province.create!(name: "Ontario", hst_rate: 0.13)
Province.create!(name: "Québec", pst_rate: 0.09975, gst_rate: 0.05)
Province.create!(name: "New Brunswick", hst_rate: 0.15)
Province.create!(name: "Nova Scotia", hst_rate: 0.15)
Province.create!(name: "Prince Edward Island", hst_rate: 0.15)
Province.create!(name: "Newfoundland and Labrador", hst_rate: 0.15)

# Product Brands
20.times do
  ProductBrand.create!(name: Faker::Commerce.brand)
  rescue ActiveRecord::RecordNotUnique
  # Ignored
end

# Product Categories
10.times do
  ProductCategory.create!(name: Faker::Commerce.department(max: 1))
  rescue ActiveRecord::RecordNotUnique
  # Ignored
end

# Product Types
category_ids = ProductCategory.pluck(:id)
10.times do
  ProductType.create!(product_category_id: category_ids.sample, name: Faker::Commerce.product_name)
  rescue ActiveRecord::RecordNotUnique
  # Ignored
end

# Products
type_ids = ProductType.pluck(:id)
brand_ids = ProductBrand.pluck(:id)
100.times do
  type_id = type_ids.sample
  Product.create!(product_brand_id: brand_ids.sample, product_type_id: type_id,
                  product_number: Faker::Vehicle.vin, description: Faker::Commerce.material,
                  price: Faker::Commerce.price,
                  name: "#{Faker::Adjective.positive} #{ProductType.find(type_id).name}")
end

# Vehicle Makes
15.times do
  VehicleMake.create!(name: Faker::Vehicle.make)
  rescue ActiveRecord::RecordNotUnique
  # Ignored
end

# Vehicle Years
8.times do
  VehicleYear.create!(year: Faker::Vehicle.year)
  rescue ActiveRecord::RecordNotUnique
  # Ignored
end

# Vehicle Models
20.times do
  VehicleModel.create!(name: Faker::Vehicle.model)
  rescue ActiveRecord::RecordNotUnique
  # Ignored
end

# Vehicles
make_ids = VehicleMake.pluck(:id)
year_ids = VehicleYear.pluck(:id)
model_ids = VehicleModel.pluck(:id)
20.times do
  Vehicle.create!(vehicle_make_id: make_ids.sample, vehicle_year_id: year_ids.sample,
                  vehicle_model_id: model_ids.sample)
  rescue ActiveRecord::RecordNotUnique
  # Ignored
end

# Product Fitments
product_ids = Product.pluck(:id)
vehicle_ids = Vehicle.pluck(:id)
150.times do
  ProductFitment.create!(product_id: product_ids.sample, vehicle_id: vehicle_ids.sample)
rescue ActiveRecord::RecordNotUnique
  # Ignored
end
