class Api::V1::DevicesController < ApplicationController

  def index
    @devices = Device.all
  end

end
