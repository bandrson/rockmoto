ActiveAdmin.register Product do
  permit_params :product_brand_id, :product_category_id, :product_number, :name, :description, :price
end