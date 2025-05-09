class PropertyType < ApplicationRecord
    validates :name, presence: { message: "não pode ficar em branco" },
    uniqueness: { message: "já está cadastrada" },
    length: { minimum: 3, message: "deve ter ao menos 3 letras" }
end
