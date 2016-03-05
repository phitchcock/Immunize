class Api::V1::DevicesController < ApplicationController

  before_action :authenticate_user!

  def index
    @devices = Device.all
  end

end
