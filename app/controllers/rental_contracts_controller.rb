# app/controllers/rental_contracts_controller.rb
class RentalContractsController < ApplicationController
    before_action :set_rental_contract, only: [ :show, :update, :destroy ]


    def index
      rental_contracts = RentalContract
        .includes(:client, :property)
        .joins(:property)
        .where(properties: { negotiation_type: "Aluguel" })

      render json: rental_contracts.as_json(include: {
        client: { only: [ :id, :name ] },
        property: { only: [ :id, :title ] }
      })
    end


    def show
      render json: @rental_contract
    end


    def create
      @rental_contract = RentalContract.new(rental_contract_params)

      if @rental_contract.save
        render json: @rental_contract, status: :created, location: @rental_contract
      else
        render json: { errors: @rental_contract.errors.full_messages }, status: :unprocessable_entity
      end
    end

    def update
      if @rental_contract.update(rental_contract_params)
        render json: @rental_contract
      else
        render json: { errors: @rental_contract.errors.full_messages }, status: :unprocessable_entity
      end
    end


    def destroy
      @rental_contract.destroy
      head :no_content # HTTP Status 204
    end

    private


    def set_rental_contract
      @rental_contract = RentalContract.find(params[:id])
    end

    def rental_contract_params
      params.require(:rental_contract).permit(:client_id, :property_id, :start_date, :end_date, :monthly_rent, :deposit_amount, :status)
    end
end
