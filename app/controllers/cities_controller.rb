class CitiesController < ApplicationController
    before_action :set_city, only: [:show, :update, :destroy]
  
    def index
      @cities = City.all
      render json: @cities
    end
  
    def show
      render json: @city
    end
  
    def create
      @city = City.new(city_params)
      if @city.save
        render json: @city, status: :created
      else
        render json: { errors: @city.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    def update
      if @city.update(city_params)
        render json: @city
      else
        render json: { errors: @city.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    def destroy
      @city.destroy
      head :no_content
    end
  
    private
  
    def set_city
      @city = City.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render json: { error: 'Cidade não encontrada' }, status: :not_found
    end
  
    def city_params
      params.require(:city).permit(:name)
    end
  end
  