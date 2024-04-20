class AddUniqueNameConstraints < ActiveRecord::Migration[7.1]
  def change
    add_index :product_brands, :name, unique: true
    add_index :product_categories, :name, unique: true
    add_index :product_types, :name, unique: true
    add_index :vehicle_makes, :name, unique: true
    add_index :vehicle_years, :year, unique: true
  end
end
