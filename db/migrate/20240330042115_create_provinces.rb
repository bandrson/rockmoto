class CreateProvinces < ActiveRecord::Migration[7.1]
  def change
    create_table :provinces do |t|
      t.string :name, null: false
      t.decimal :pst_rate
      t.decimal :gst_rate
      t.decimal :hst_rate

      t.timestamps
    end
  end
end
