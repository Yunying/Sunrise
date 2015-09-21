class AddContractIdToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :contract_id, :integer
  end
end
