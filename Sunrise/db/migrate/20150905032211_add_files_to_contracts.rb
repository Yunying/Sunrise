class AddFilesToContracts < ActiveRecord::Migration
  def change
    add_column :contracts, :files, :json
  end
end
