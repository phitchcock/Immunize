# == Schema Information
#
# Table name: locations
#
#  id            :integer          not null, primary key
#  name          :string
#  street_number :string
#  street_name   :string
#  city          :string
#  state         :string
#  zip           :string
#  date          :string
#  time          :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  info          :text
#

class LocationsController < ApplicationController

  layout "location"

  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_location, only: [:show, :edit, :update, :destroy]



  def index
    @locations = Location.all

    @hash = Gmaps4rails.build_markers(@locations) do |location, marker|
      marker.lat location.latitude
      marker.lng location.longitude
    end
  end

  def show
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
