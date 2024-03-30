class CreateProductFitments < ActiveRecord::Migration[7.1]
  def change
    create_table :product_fitments do |t|
      t.references :product, null: false, foreign_key: true
      t.references :vehicle, null: false, foreign_key: true

      t.timestamps
      t.index [ :product_id, :vehicle_id ], unique: true
    end
  end
end
