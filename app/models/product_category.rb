class ProductCategory < ApplicationRecord
  belongs_to :parent, class_name: "ProductCategory", optional: true

  validates :name, presence: true
end
