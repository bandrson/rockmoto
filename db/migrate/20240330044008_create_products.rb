class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.references :product_brand, null: false, foreign_key: true
      t.references :product_category, null: false, foreign_key: true
      t.string :product_number, null: false
      t.text :description
      t.decimal :price, null: false

      t.timestamps
    end
  end
end
