class AddFileToContracts < ActiveRecord::Migration
  def change
    add_column :contracts, :file, :string
  end
end
