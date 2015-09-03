class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :order_id
      t.integer :vendor_id
      t.float :unit_price
      t.integer :unit_count
      t.float :amount
      t.text :content

      t.timestamps null: false
    end
  end
end
