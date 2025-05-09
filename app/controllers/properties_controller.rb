# app/controllers/properties_controller.rb
class PropertiesController < ApplicationController
    # Antes de processar as ações, garante que a propriedade esteja presente
    before_action :set_property, only: [:show, :update, :destroy]
  
    # GET /properties
    def index
      @properties = Property.all
      render json: @properties
    end
  
    # GET /properties/:id
    def show
      render json: @property
    end
  
    # POST /properties
    def create
      @property = Property.new(property_params)
      
      if @property.save
        render json: @property, status: :created, location: @property
      else
        render json: { errors: @property.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /properties/:id
    def update
      if @property.update(property_params)
        render json: @property
      else
        render json: { errors: @property.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    # DELETE /properties/:id
    def destroy
      @property.destroy
      head :no_content # HTTP Status 204
    end
  
    private
  
    # Set the property based on the ID
    def set_property
      @property = Property.find(params[:id])
    end
  
    # Only allow a trusted parameter "white list" through.
    def property_params
      params.require(:property).permit(
        :title,
        :negotiation_type, 
        :description,
        :bedrooms,
        :bathrooms,
        :suites,
        :price,
        :latitude,
        :longitude,
        :neighborhood,
        :city_id,        
        :state,
        :address,
        :property_type_id, 
        :owner_id          
      )
    end
  end
  