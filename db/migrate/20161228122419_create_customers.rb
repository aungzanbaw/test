class CreateCustomers < ActiveRecord::Migration[5.0]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :phone, unique: true
      t.string :password
      t.string :city
      t.string :address 
      t.text   :auth_token
      t.timestamps
    end
  end
end
