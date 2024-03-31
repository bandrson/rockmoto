class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      t.references :customer, null: false, foreign_key: true
      t.integer :status, null: false, default: 0
      t.decimal :gst_rate
      t.decimal :pst_rate
      t.decimal :hst_rate

      t.timestamps
    end
  end
end
