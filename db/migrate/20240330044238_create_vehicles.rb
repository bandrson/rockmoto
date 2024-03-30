class CreateVehicles < ActiveRecord::Migration[7.1]
  def change
    create_table :vehicles do |t|
      t.references :vehicle_make, null: false, foreign_key: true
      t.references :vehicle_model, null: false, foreign_key: true
      t.integer :year, null: false

      t.timestamps
    end
  end
end
