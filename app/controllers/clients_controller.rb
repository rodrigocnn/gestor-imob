# app/controllers/clients_controller.rb
class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :update, :destroy]

  def index
    @clients = Client.all
    render json: @clients
  end

  def show
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

  def update
    if @client.update(client_params)
      render json: @client
    else
      render json: { errors: @client.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @client.destroy
    head :no_content
  end

  private

  def set_client
    @client = Client.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Client not found" }, status: :not_found
  end

  def client_params
    params.require(:client).permit(:name, :email, :cpf, :phone)
  end
end
