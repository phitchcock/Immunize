class LocationsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_location, only: [:show, :edit, :update, :destroy]

  def index
    @locations = Location.all

    @hash = Gmaps4rails.build_markers(@locations) do |location, marker|
      marker.lat location.latitude
      marker.lng location.longitude
      marker.infowindow location.name
      marker.json({title: location.name})
    end
  end

  def show
    respond_to do |format|
      format.html
      format.js
    end
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.new(location_params)
    if @location.save
      redirect_to locations_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @location.update(location_params)
      redirect_to locations_path
    else
      render :edit
    end
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
