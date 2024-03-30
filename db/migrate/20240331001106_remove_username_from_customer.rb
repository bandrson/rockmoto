class RemoveUsernameFromCustomer < ActiveRecord::Migration[7.1]
  def change
    remove_column :customers, :username, :string
  end
end
