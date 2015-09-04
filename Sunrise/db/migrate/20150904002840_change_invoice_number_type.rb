class ChangeInvoiceNumberType < ActiveRecord::Migration
  def change
    change_column :invoices, :invoice_number, :string
  end
end
