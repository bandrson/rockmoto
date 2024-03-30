class AddScaleToOrderTaxRates < ActiveRecord::Migration[7.1]
  def change
    change_column :orders, :gst_rate, :decimal, :precision => 10, :scale => 2
    change_column :orders, :pst_rate, :decimal, :precision => 10, :scale => 2
    change_column :orders, :hst_rate, :decimal, :precision => 10, :scale => 2
  end
end
