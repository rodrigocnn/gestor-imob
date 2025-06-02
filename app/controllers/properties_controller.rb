# app/controllers/properties_controller.rb
class PropertiesController < ApplicationController
    # Antes de processar as ações, garante que a propriedade esteja presente
    before_action :set_property, only: [ :show, :update, :destroy ]


    def index
      @properties = Property.all
      render json: @properties
    end

    def rent_all
      @properties = Property.where(negotiation_type: "Aluguel")
      render json: @properties
    end


    def show
      render json: @property
    end


    def create
      @property = Property.new(property_params)

      if @property.save
        render json: @property, status: :created, location: @property
      else
        render json: { errors: @property.errors.full_messages }, status: :unprocessable_entity
      end
    end


    def update
      if @property.update(property_params)
        render json: @property
      else
        render json: { errors: @property.errors.full_messages }, status: :unprocessable_entity
      end
    end

    # DELETE /properties/:id
    def destroy
      if @property.destroy
        head :no_content
      else
        render json: { error: @property.errors.full_messages.to_sentence }, status: :unprocessable_entity
      end
    end
    private


    def set_property
      @property = Property.find(params[:id])
    end


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
