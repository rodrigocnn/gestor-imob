# app/controllers/owners_controller.rb
class OwnersController < ApplicationController

    before_action :set_owner, only: [:show, :update, :destroy]
  
    def index
      @owners = Owner.all
      render json: @owners
    end
  
    def show
      render json: @owner
    end
  
    def create
      @owner = Owner.new(owner_params)
      
      if @owner.save
        render json: @owner, status: :created, location: @owner
      else
        render json: { errors: @owner.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    def update
      if @owner.update(owner_params)
        render json: @owner
      else
        render json: { errors: @owner.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    def destroy
      @owner.destroy
      head :no_content # HTTP Status 204
    end
  
    private
  

    def set_owner
      @owner = Owner.find(params[:id])
    end
  
  
    def owner_params
      params.require(:owner).permit(:name, :email, :cpf , :phone)
    end
  end
  
