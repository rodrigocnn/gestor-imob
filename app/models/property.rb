class Property < ApplicationRecord
  belongs_to :city
  belongs_to :property_type
  belongs_to :owner

  validates :title,
            presence: { message: "não pode ficar em branco" },
            length: { minimum: 5, message: "deve ter pelo menos 5 caracteres" }

  validates :negotiation_type,
            presence: { message: "não pode ficar em branco" },
            inclusion: { in: %w[venda aluguel], message: "deve ser 'venda' ou 'aluguel'" }

  validates :description,
            presence: { message: "não pode ficar em branco" },
            length: { minimum: 10, message: "deve ter pelo menos 10 caracteres" }

  validates :bedrooms,
            numericality: { only_integer: true, greater_than_or_equal_to: 0, message: "deve ser um número inteiro maior ou igual a 0" }

  validates :bathrooms,
            numericality: { only_integer: true, greater_than_or_equal_to: 0, message: "deve ser um número inteiro maior ou igual a 0" }

  validates :suites,
            numericality: { only_integer: true, greater_than_or_equal_to: 0, message: "deve ser um número inteiro maior ou igual a 0" }

  validates :price,
            presence: { message: "não pode ficar em branco" },
            numericality: { greater_than: 0, message: "deve ser maior que zero" }

  validates :latitude,
            numericality: { allow_nil: true, message: "deve ser um número válido" }

  validates :longitude,
            numericality: { allow_nil: true, message: "deve ser um número válido" }

  validates :neighborhood,
            presence: { message: "não pode ficar em branco" }

  validates :state,
            presence: { message: "não pode ficar em branco" },
            format: { with: /\A[A-Z]{2}\z/, message: "deve ter exatamente 2 letras maiúsculas (ex: SP, RJ)" }

  validates :address,
            presence: { message: "não pode ficar em branco" }

  validates :city, presence: { message: "deve estar associado a uma cidade válida" }
  validates :property_type, presence: { message: "deve estar associado a um tipo de imóvel válido" }
  validates :owner, presence: { message: "deve estar associado a um proprietário válido" }
end
