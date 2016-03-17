class Api::V1::DevicesController < ApplicationController

  #before_action :authenticate_user!, except: [:create]

  def index
    @devices = Device.all
  end

  def create
    device = Device.find_or_initialize_by(device_params)

    if device.save
      render json: device, status: 201
    else
      render json: { errors: device.errors }, status: 422
    end
  end

  private

  def device_params
    params.require(:device).permit(:device_token)
  end

end
