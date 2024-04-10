class SwitchYearFieldInVehicleToModel < ActiveRecord::Migration[7.1]
  def change
    remove_column :vehicles, :year, :integer
    add_reference :vehicles, :vehicle_year, foreign_key: true
  end
end
