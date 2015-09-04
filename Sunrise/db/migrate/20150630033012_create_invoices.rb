class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.integer :client_id
      t.integer :invoice_number
      t.date :invoice_date
      t.float :total_number

      t.timestamps null: false
    end
  end
end
