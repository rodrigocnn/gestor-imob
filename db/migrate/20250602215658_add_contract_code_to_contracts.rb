class AddContractCodeToContracts < ActiveRecord::Migration[7.2]
  def change
    add_column :rental_contracts, :contract_code, :string
    add_index :rental_contracts, :contract_code, unique: true
  end
end
