class NotificationsController < ApplicationController

    def index
        @notifications = Rpush::Apns::Notification.all
    end

    def new
        @notification = Notification.new
    end

    def create
      # Create app first
      # app = Rpush::Apns::App.new
      # app.name = "iOSApp"
      # app.certificate = File.read("lib/certs/sandbox.pem")
      # app.environment = "sandbox" # APNs environment.
      # app.password = ""
      # app.connections = 1
      # app.save!
      @notification = Notification.new(notification_params)

      if @notification.save
        send_notification(@notification)
        redirect_to notifications_path
      else
        render :new
      end
    end

    def send_notification(notification)
      n = Rpush::Apns::Notification.new
      n.app = Rpush::Apns::App.find_by_name("iOSApp")
      n.device_token = Device.last.device_token #Device.all.map{|device| device.device_token} # 64-character hex string
      n.alert = notification.message
      n.data = { data: notification.title }
      n.save!
    end

    private

    def notification_params
      params.require(:notification).permit!
    end

end
