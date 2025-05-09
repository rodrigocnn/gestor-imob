class CreateProperties < ActiveRecord::Migration[7.2]
  def change
    create_table :properties do |t|
      t.string :title
      t.string :negotiation_type
      t.text :description
      t.integer :bedrooms
      t.integer :bathrooms
      t.integer :suites
      t.float :price
      t.float :latitude
      t.float :longitude
      t.string :neighborhood
      t.string :state
      t.string :address
      t.references :city, null: false, foreign_key: true
      t.references :property_type, null: false, foreign_key: true
      t.references :owner, null: false, foreign_key: true

      t.timestamps
    end
  end
end
