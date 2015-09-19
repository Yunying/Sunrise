class AddCostToContracts < ActiveRecord::Migration
  def change
    add_column :contracts, :cost, :float
  end
end
