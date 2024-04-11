class RemoveParentFromProductCategories < ActiveRecord::Migration[7.1]
  def change
    remove_column :product_categories, :parent_id, :integer
  end
end
