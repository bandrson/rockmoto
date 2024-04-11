class AddTypeToProduct < ActiveRecord::Migration[7.1]
  def change
      remove_column :products, :product_category_id, :integer
      add_reference :products, :product_type, index: true
  end
end
