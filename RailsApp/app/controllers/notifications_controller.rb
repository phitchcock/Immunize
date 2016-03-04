class NotificationsController < ApplicationController

    def index
        @n = Rpush::Apns::Notification.all
    end

    def new
        n = Rpush::Apns::Notification.new
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
        # @n = Notification.new
        # @n.app = Rpush::Apns::App.find_by_name("iOSApp")
        # @n.device_token = "D3DFD081B9B311D145357B3CA433F472375E12CAE69283890BAFBC6EE5B54F29" # 64-character hex string
        # @n.alert = params[:alert]
        # @n.data = { data: params[:data] }
        # if @n.save
        #     redirect_to notifications_path
        # end

        # Once app has been created can now create notification
        n = Rpush::Apns::Notification.new
        n.app = Rpush::Apns::App.find_by_name("iOSApp")
        n.device_token = "D3DFD081B9B311D145357B3CA433F472375E12CAE69283890BAFBC6EE5B54F29" # 64-character hex string
        n.alert = params[:alert]
        n.data = { data: params[:data] }
        if n.save
            redirect_to notifications_path
        else
            render :new
        end
    end

end
