class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :content
      t.integer :contract_id
      t.integer :invoice_id
      t.integer :order_id

      t.timestamps null: false
    end
  end
end
