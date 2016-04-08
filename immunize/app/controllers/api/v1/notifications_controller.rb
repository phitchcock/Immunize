class Api::V1::NotificationsController < ApplicationController

  before_action :authenticate_user!

  def index
    @notifications = Rpush::Apns::Notification.all
  end
end
