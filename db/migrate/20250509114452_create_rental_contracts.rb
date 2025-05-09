class CreateRentalContracts < ActiveRecord::Migration[7.2]
  def change
    create_table :rental_contracts do |t|
      t.references :client, null: false, foreign_key: true
      t.references :property, null: false, foreign_key: true
      t.datetime :start_date
      t.datetime :end_date
      t.float :monthly_rent
      t.float :deposit_amount
      t.string :status

      t.timestamps
    end
  end
end
