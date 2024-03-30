class CreateVehicleModels < ActiveRecord::Migration[7.1]
  def change
    create_table :vehicle_models do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end
