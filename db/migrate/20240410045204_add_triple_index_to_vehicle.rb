class AddTripleIndexToVehicle < ActiveRecord::Migration[7.1]
  def change
    add_index :vehicles, [:vehicle_year_id, :vehicle_make_id, :vehicle_model_id], unique: true
  end
end
