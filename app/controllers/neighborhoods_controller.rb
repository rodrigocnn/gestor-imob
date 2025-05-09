class NeighborhoodsController < ApplicationController
    before_action :set_neighborhood, only: [:show, :update, :destroy]
  
    def index
      @neighborhoods = Neighborhood.all
      render json: @neighborhoods
    end
  
    def show
      render json: @neighborhood
    end
  
    def create
      @neighborhood = Neighborhood.new(neighborhood_params)
  
      if @neighborhood.save
        render json: @neighborhood, status: :created
      else
        render json: { errors: @neighborhood.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    def update
      if @neighborhood.update(neighborhood_params)
        render json: @neighborhood
      else
        render json: { errors: @neighborhood.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    def destroy
      @neighborhood.destroy
      head :no_content
    end
  
    private
  
    def set_neighborhood
      @neighborhood = Neighborhood.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render json: { error: 'Neighborhood not found' }, status: :not_found
    end
  
    def neighborhood_params
      params.require(:neighborhood).permit(:name, :city_id)
    end
  end
  
