# app/controllers/rent_payments_controller.rb
class RentPaymentsController < ApplicationController
    # Antes de processar as ações, garante que o pagamento do aluguel esteja presente
    before_action :set_rent_payment, only: [:show, :update, :destroy]
  
    # GET /rent_payments
    def index
      @rent_payments = RentPayment.all
      render json: @rent_payments
    end
  
    # GET /rent_payments/:id
    def show
      render json: @rent_payment
    end
  
    # POST /rent_payments
    def create
      @rent_payment = RentPayment.new(rent_payment_params)
      
      if @rent_payment.save
        render json: @rent_payment, status: :created, location: @rent_payment
      else
        render json: { errors: @rent_payment.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /rent_payments/:id
    def update
      if @rent_payment.update(rent_payment_params)
        render json: @rent_payment
      else
        render json: { errors: @rent_payment.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    # DELETE /rent_payments/:id
    def destroy
      @rent_payment.destroy
      head :no_content # HTTP Status 204
    end
  
    private
  
    # Set the rent_payment based on the ID
    def set_rent_payment
      @rent_payment = RentPayment.find(params[:id])
    end
  
    # Only allow a trusted parameter "white list" through.
    def rent_payment_params
      params.require(:rent_payment).permit(:rentalContractId, :dueDate, :paymentDate, :amount, :status)
    end
  end
  