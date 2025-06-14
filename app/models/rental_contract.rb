class RentalContract < ApplicationRecord
  belongs_to :client
  belongs_to :property

  after_create :generate_contract_code

# Validações
validates :client_id,
          :property_id,
          :start_date,
          :end_date,
          presence: { message: "não pode ficar em branco" }

  validates :monthly_rent,
            presence: { message: "Valor do aluguel é obrigatório" },
            numericality: { greater_than_or_equal_to: 0, message: "O valor do aluguel deve ser um número positivo" }

  validates :deposit_amount,
            presence: { message: "Valor do depósito é obrigatório" },
            numericality: { greater_than_or_equal_to: 0, message: "O valor do depósito deve ser um número positivo" }

  validates :status,
            presence: { message: "Status é obrigatório" },
            inclusion: { in: [ "ativo", "inativo" ], message: "%{value} não é um status válido" }

  validates :contract_code, uniqueness: true, allow_nil: true

  # Validação customizada

  validate :end_date_after_start_date

  private

  def end_date_after_start_date
    if end_date.present? && start_date.present? && end_date < start_date
      errors.add(:end_date, "deve ser posterior à data de início")
    end
  end

  def generate_contract_code
    date = Time.current.strftime("%Y%m%d")
    code = "CONTRATO-#{date}-#{id}"
    update_column(:contract_code, code)
  end
end
