class LocationsController < ApplicationController
  def index
    @locations = Location.all
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def location_params
    params.require(:location).permit!
  end

  def set_location
    @location = Location.find(params[:id])
  end

end
