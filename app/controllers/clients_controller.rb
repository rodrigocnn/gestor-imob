# app/controllers/clients_controller.rb
class ClientsController < ApplicationController
    def index
      @clients = Client.all
      render json: @clients
    end
  
    def show
      @client = Client.find(params[:id])
      render json: @client
    end
  
    def create
      @client = Client.new(client_params)
      if @client.save
        render json: @client, status: :created
      else
        render json: { errors: @client.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    private
  
    def client_params
      params.require(:client).permit(:name, :email, :cpf, :phone)
    end
  end
  