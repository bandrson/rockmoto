class MakeVehicleYearReferenceNonNullable < ActiveRecord::Migration[7.1]
  def change
    change_column_null :vehicles, :vehicle_year_id, false
  end
end
