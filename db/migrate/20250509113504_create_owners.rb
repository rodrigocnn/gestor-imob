class CreateOwners < ActiveRecord::Migration[7.2]
  def change
    create_table :owners do |t|
      t.string :name
      t.string :email
      t.string :cpf
      t.string :phone

      t.timestamps
    end
  end
end
