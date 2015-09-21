class AddCompanyToContracts < ActiveRecord::Migration
  def change
    add_column :contracts, :company, :string
  end
end
