class Api::V1::LocationsController < ApplicationController
  
  def index
    @locations = Location.all
  end
  
end
