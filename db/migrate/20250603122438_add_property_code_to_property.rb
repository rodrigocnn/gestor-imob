class AddPropertyCodeToProperty < ActiveRecord::Migration[7.2]
  def change
    add_column :properties, :property_code, :string
    add_index :properties, :property_code, unique: true
  end
end
