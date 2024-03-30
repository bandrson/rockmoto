class AddScaleToOrderItemPrice < ActiveRecord::Migration[7.1]
  def change
    change_column :order_items, :price, :decimal, :precision => 10, :scale => 2
  end
end
