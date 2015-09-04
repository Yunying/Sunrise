class CreateVendors < ActiveRecord::Migration
  def change
    create_table :vendors do |t|
      t.string :name
      t.string :address
      t.string :telephone
      t.string :email

      t.timestamps null: false
    end
  end
end
