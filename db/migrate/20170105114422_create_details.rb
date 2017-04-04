class CreateDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :details do |t|
      t.references :order, foreign_key: true
      # t.references :product, foreign_key: true
      t.string :name
      t.integer :qty
      t.integer :price
      t.string :remark
      t.timestamps
    end
  end
end
