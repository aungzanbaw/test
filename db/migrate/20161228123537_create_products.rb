class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :brand
      t.string :group
      t.integer :price
      t.references :department, foreign_key: true

      t.timestamps
    end
  end
end
