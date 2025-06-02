class Client < ApplicationRecord

    has_many :rental_contracts

    validates :name,
    presence: { message: "não pode ficar em branco" },
    length: { minimum: 3, message: "deve ter pelo menos 3 letras" }

validates :email,
    presence: { message: "não pode ficar em branco" },
    uniqueness: { case_sensitive: false, message: "já está em uso" },
    format: { with: URI::MailTo::EMAIL_REGEXP, message: "não é um email válido" }

validates :cpf,
    presence: { message: "não pode ficar em branco" },
    uniqueness: { message: "já está cadastrado" },
    format: { with: /\A\d{3}\.\d{3}\.\d{3}-\d{2}\z/, message: "deve estar no formato 000.000.000-00" }


validates :phone,
    presence: { message: "não pode ficar em branco" },
    format: { 
        with: /\A\(\d{2}\)\s?\d{4,5}-\d{4}\z/,
        message: "deve estar no formato (00) 00000-0000 ou (00) 0000-0000"
      }
end
