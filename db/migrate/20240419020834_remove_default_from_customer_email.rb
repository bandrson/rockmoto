class RemoveDefaultFromCustomerEmail < ActiveRecord::Migration[7.1]
  def change
    change_column :customers, :email, :string, null: false
  end
end
