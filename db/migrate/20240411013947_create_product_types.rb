class CreateProductTypes < ActiveRecord::Migration[7.1]
  def change
    create_table :product_types do |t|
      t.string :name
      t.references :product_category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
