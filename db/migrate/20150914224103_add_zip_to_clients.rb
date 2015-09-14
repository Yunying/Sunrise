class AddZipToClients < ActiveRecord::Migration
  def change
    add_column :clients, :zip, :string
  end
end
