# app/controllers/rent_payments_controller.rb
class RentPaymentsController < ApplicationController
    # Antes de processar as ações, garante que o pagamento do aluguel esteja presente
    before_action :set_rent_payment, only: [:show, :update, :destroy]
  

    def index
      @rent_payments = RentPayment.order(due_date: :asc)
      render json: @rent_payments
    end
  

    def show
      render json: @rent_payment
    end

    def show_by_contract
      @rent_payments = RentPayment.where(rental_contract_id: params[:rental_contract_id])
      render json: @rent_payments
    end

  
    def create
      @rent_payment = RentPayment.new(rent_payment_params)
      
      if @rent_payment.save
        render json: @rent_payment, status: :created, location: @rent_payment
      else
        render json: { errors: @rent_payment.errors.full_messages }, status: :unprocessable_entity
      end
    end
  

    def update
      if @rent_payment.update(rent_payment_params)
        render json: @rent_payment
      else
        render json: { errors: @rent_payment.errors.full_messages }, status: :unprocessable_entity
      end
    end

    def filter
      filters = filter_params
    
      if filters[:rental_contract_id].present?
        results = RentPayment.where(rental_contract_id: filters[:rental_contract_id])
      else
        # Apenas :filter_by é obrigatório agora
        if filters[:filter_by].blank?
          return render json: { error: "Campo obrigatório ausente: filter_by" }, status: :bad_request
        end
    
        field_map = {
          "payment" => "payment_date",
          "due" => "due_date"
        }
    
        field = field_map[filters[:filter_by]]
        unless field
          return render json: { error: "Valor inválido para filter_by. Use 'payment' ou 'due'." }, status: :bad_request
        end
    
        query = RentPayment.all
        query = query.where(status: filters[:status]) if filters[:status].present?
    
        if filters[:initial_date].present? && filters[:end_date].present?
          query = query.where("#{field} BETWEEN ? AND ?", filters[:initial_date], filters[:end_date])
        end
    
        results = query
      end
    
      render json: results
    end

  

    def destroy
      @rent_payment.destroy
      head :no_content # HTTP Status 204
    end
  
    private
  
    def filter_params
      params.permit(:rental_contract_id, :status, :filter_by, :initial_date, :end_date)
    end
 
    def set_rent_payment
      @rent_payment = RentPayment.find(params[:id])
    end
  

    def rent_payment_params
      params.require(:rent_payment).permit(:rental_contract_id, :due_date, :payment_date, :amount, :status)
    end
  end
  