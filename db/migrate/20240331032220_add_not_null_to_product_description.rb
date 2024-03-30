class AddNotNullToProductDescription < ActiveRecord::Migration[7.1]
  def change
    change_column :products, :description, :text, null: false
  end
end
