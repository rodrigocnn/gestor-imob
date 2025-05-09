class RentPayment < ApplicationRecord
  belongs_to :rental_contract
 
  validates :rental_contract_id, presence: { message: "deve estar associado a um contrato de aluguel" }
  validates :payment_date, absence: false
  validates :due_date, presence: { message: "deve ser informada" }
  validates :amount, presence: { message: "deve ser informado" },
  numericality: { greater_than: 0, message: "deve ser maior que zero" }
  validates :status, presence: { message: "deve ser informado" },
  inclusion: { in: %w[pago pendente atrasado],
               message: "deve ser 'pago', 'pendente' ou 'atrasado'" }

end
