class CreateCustomers < ActiveRecord::Migration[7.1]
  def change
    create_table :customers do |t|
      t.string :username
      t.string :password
      t.string :full_name, null: false
      t.string :email, null: false
      t.string :phone_number, null: false
      t.string :street_address1, null: false
      t.string :street_address2, null: false
      t.string :city, null: false
      t.string :postal_code, null: false
      t.references :province, null: false, foreign_key: true

      t.timestamps
    end
  end
end
