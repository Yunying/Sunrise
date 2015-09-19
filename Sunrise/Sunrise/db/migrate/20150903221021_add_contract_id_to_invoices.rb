class AddContractIdToInvoices < ActiveRecord::Migration
  def change
    add_column :invoices, :contract_id, :integer
  end
end
