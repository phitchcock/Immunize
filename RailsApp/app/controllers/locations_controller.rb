class LocationsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_location, only: [:show, :edit, :update, :destroy]

  def index
    @locations = Location.all
  end

  def show
  end

  def new
    @location = Location.new
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
