module Admin
  class NotificationsController < Admin::ApplicationController
    # To customize the behavior of this controller,
    # simply overwrite any of the RESTful actions. For example:
    #
    # def index
    #   super
    #   @resources = Notification.all.paginate(10, params[:page])
    # end
    def index
      @notifications = Rpush::Apns::Notification.all
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

  private

  def notification_params
    params.require(:notification).permit!
  end

  def send_notification(notification)
    Device.all.each do |d|
      n = Rpush::Apns::Notification.new
      n.app = Rpush::Apns::App.find_by_name("iOSApp")
      n.device_token = d.device_token #64-character hex string
      n.alert = notification.message
      n.data = { data: notification.title }
      n.save!
    end
  end

    # Define a custom finder by overriding the `find_resource` method:
    # def find_resource(param)
    #   Notification.find_by!(slug: param)
    # end

    # See https://administrate-docs.herokuapp.com/customizing_controller_actions
    # for more information
  end
end
