class CreateRentPayments < ActiveRecord::Migration[7.2]
  def change
    create_table :rent_payments do |t|
      t.references :rental_contract, null: false, foreign_key: true
      t.datetime :due_date
      t.datetime :payment_date
      t.float :amount
      t.string :status

      t.timestamps
    end
  end
end
