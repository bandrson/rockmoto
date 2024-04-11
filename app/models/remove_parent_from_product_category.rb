class RemoveParentFromProductCategory < ApplicationRecord
  def change
    remove_column :product_categories, :parent_id, :integer
  end
end
