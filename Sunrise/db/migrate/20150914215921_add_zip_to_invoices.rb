class AddZipToInvoices < ActiveRecord::Migration
  def change
    add_column :invoices, :zip, :string
  end
end
