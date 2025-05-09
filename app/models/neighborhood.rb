class Neighborhood < ApplicationRecord
  belongs_to :city

  validates :name, presence: { message: "não pode ficar em branco" },
  uniqueness: { message: "já está cadastrada" },
  length: { minimum: 3, message: "deve ter ao menos 3 letras" }

  validates :city, presence: { message: "deve estar associado a uma cidade válida" }
end
