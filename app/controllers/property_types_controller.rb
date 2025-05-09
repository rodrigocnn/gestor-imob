# app/controllers/property_types_controller.rb
class PropertyTypesController < ApplicationController
    # Antes de processar as ações, garante que o tipo de propriedade esteja presente
    before_action :set_property_type, only: [:show, :update, :destroy]
  
    # GET /property_types
    def index
      @property_types = PropertyType.all
      render json: @property_types
    end
  
    # GET /property_types/:id
    def show
      render json: @property_type
    end
  
    # POST /property_types
    def create
      @property_type = PropertyType.new(property_type_params)
      
      if @property_type.save
        render json: @property_type, status: :created, location: @property_type
      else
        render json: { errors: @property_type.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /property_types/:id
    def update
      if @property_type.update(property_type_params)
        render json: @property_type
      else
        render json: { errors: @property_type.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    # DELETE /property_types/:id
    def destroy
      @property_type.destroy
      head :no_content # HTTP Status 204
    end
  
    private
  
    # Set the property_type based on the ID
    def set_property_type
      @property_type = PropertyType.find(params[:id])
    end
  
    # Only allow a trusted parameter "white list" through.
    def property_type_params
      params.require(:property_type).permit(:name)
    end
  end
  