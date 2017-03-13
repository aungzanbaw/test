class CreateStaffs < ActiveRecord::Migration[5.0]
  def change
    create_table :staffs do |t|
      t.string :username
      t.string :password
      t.references :department, foreign_key: true

      t.timestamps
    end
  end
end
