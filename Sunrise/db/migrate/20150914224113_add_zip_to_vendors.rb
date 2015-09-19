class AddZipToVendors < ActiveRecord::Migration
  def change
    add_column :vendors, :zip, :string
  end
end
