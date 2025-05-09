class RentalContract < ApplicationRecord
  belongs_to :client
  belongs_to :property

  # Validações
  validates :client_id, presence: { message: "Cliente é obrigatório" }
  validates :property_id, presence: { message: "Propriedade é obrigatória" }
  validates :start_date, presence: { message: "Data de início é obrigatória" }
  validates :end_date, presence: { message: "Data de término é obrigatória" }
  validates :monthly_rent, presence: { message: "Valor do aluguel é obrigatório" },
                           numericality: { greater_than_or_equal_to: 0, message: "O valor do aluguel deve ser um número positivo" }
  validates :deposit_amount, presence: { message: "Valor do depósito é obrigatório" },
                             numericality: { greater_than_or_equal_to: 0, message: "O valor do depósito deve ser um número positivo" }
  validates :status, presence: { message: "Status é obrigatório" }, inclusion: { in: ['ativo', 'inativo'], message: "%{value} não é um status válido" }

  # Validação para garantir que a data de término seja posterior à data de início
  validate :end_date_after_start_date

  private

  def end_date_after_start_date
    if end_date.present? && start_date.present? && end_date < start_date
      errors.add(:end_date, "deve ser posterior à data de início")
    end
  end
end
