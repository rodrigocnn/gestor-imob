class DashboardsController < ApplicationController
  def show
       render json: Dashboard::DashboardReport.new.call
  end
end
