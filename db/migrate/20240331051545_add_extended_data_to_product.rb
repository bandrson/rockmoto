class AddExtendedDataToProduct < ActiveRecord::Migration[7.1]
  def change
    add_column :products, :extended_data, :jsonb, null: false, default: '{}'
    add_index :products, :extended_data, using: :gin
  end
end
