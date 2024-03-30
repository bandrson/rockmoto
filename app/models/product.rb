class Product < ApplicationRecord
  belongs_to :product_brand
  belongs_to :product_category
end
