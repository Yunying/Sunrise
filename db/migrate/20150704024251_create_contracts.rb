class CreateContracts < ActiveRecord::Migration
  def change
    create_table :contracts do |t|
      t.string :title
      t.integer :client_id
      t.date :sign_date
      t.text :description
      t.float :amount

      t.timestamps null: false
    end
  end
end
