# app/controllers/rental_contracts_controller.rb
class RentalContractsController < ApplicationController
    # Antes de processar as ações, garante que o contrato de locação esteja presente
    before_action :set_rental_contract, only: [:show, :update, :destroy]
  
    # GET /rental_contracts
    def index
      @rental_contracts = RentalContract.all
      render json: @rental_contracts
    end
  
    # GET /rental_contracts/:id
    def show
      render json: @rental_contract
    end
  
    # POST /rental_contracts
    def create
      @rental_contract = RentalContract.new(rental_contract_params)
      
      if @rental_contract.save
        render json: @rental_contract, status: :created, location: @rental_contract
      else
        render json: { errors: @rental_contract.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /rental_contracts/:id
    def update
      if @rental_contract.update(rental_contract_params)
        render json: @rental_contract
      else
        render json: { errors: @rental_contract.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    # DELETE /rental_contracts/:id
    def destroy
      @rental_contract.destroy
      head :no_content # HTTP Status 204
    end
  
    private
  
    # Set the rental_contract based on the ID
    def set_rental_contract
      @rental_contract = RentalContract.find(params[:id])
    end
  
    # Only allow a trusted parameter "white list" through.
    def rental_contract_params
      params.require(:rental_contract).permit(:client_id, :property_id, :start_date, :end_date, :monthly_rent, :deposit_amount, :status)
    end
  end
  