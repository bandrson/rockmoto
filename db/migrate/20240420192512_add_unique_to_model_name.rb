class AddUniqueToModelName < ActiveRecord::Migration[7.1]
  def change
    add_index :vehicle_models, :name, unique: true
  end
end
