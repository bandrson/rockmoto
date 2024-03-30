class CreateProductCategories < ActiveRecord::Migration[7.1]
  def change
    create_table :product_categories do |t|
      t.references :parent, foreign_key: {to_table: :product_categories}
      t.string :name, null: false

      t.timestamps
    end
  end
end
