class AddScaleToProvinceTaxRates < ActiveRecord::Migration[7.1]
  def change
    change_column :provinces, :gst_rate, :decimal, :precision => 10, :scale => 2
    change_column :provinces, :pst_rate, :decimal, :precision => 10, :scale => 2
    change_column :provinces, :hst_rate, :decimal, :precision => 10, :scale => 2
  end
end
