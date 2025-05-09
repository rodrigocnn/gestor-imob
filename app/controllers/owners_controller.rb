# app/controllers/owners_controller.rb
class OwnersController < ApplicationController
    # Antes de processar as ações, garante que o owner esteja presente
    before_action :set_owner, only: [:show, :update, :destroy]
  
    # GET /owners
    def index
      @owners = Owner.all
      render json: @owners
    end
  
    # GET /owners/:id
    def show
      render json: @owner
    end
  
    # POST /owners
    def create
      @owner = Owner.new(owner_params)
      
      if @owner.save
        render json: @owner, status: :created, location: @owner
      else
        render json: { errors: @owner.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /owners/:id
    def update
      if @owner.update(owner_params)
        render json: @owner
      else
        render json: { errors: @owner.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    # DELETE /owners/:id
    def destroy
      @owner.destroy
      head :no_content # HTTP Status 204
    end
  
    private
  
    # Set the owner based on the ID
    def set_owner
      @owner = Owner.find(params[:id])
    end
  
    # Only allow a trusted parameter "white list" through.
    def owner_params
      params.require(:owner).permit(:name, :email, :phone)
    end
  end
  
