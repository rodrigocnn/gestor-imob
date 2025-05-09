class Property < ApplicationRecord
  belongs_to :city
  belongs_to :property_type
  belongs_to :owner
end
