class Client < ApplicationRecord
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
    format: { with: /\A\d{11}\z/, message: "deve conter exatamente 11 números" }

validates :phone,
    presence: { message: "não pode ficar em branco" },
    format: { with: /\A\d{10,11}\z/, message: "deve conter 10 ou 11 números (DDD + número)" }
end
