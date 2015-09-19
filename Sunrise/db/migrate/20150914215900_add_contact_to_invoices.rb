class AddContactToInvoices < ActiveRecord::Migration
  def change
    add_column :invoices, :contact, :string
  end
end
