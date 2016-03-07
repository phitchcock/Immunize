module Admin
  class NotificationsController < Admin::ApplicationController

    include NotificationsHelper
    # To customize the behavior of this controller,
    # simply overwrite any of the RESTful actions. For example:
    #
    # def index
    #   super
    #   @resources = Notification.all.paginate(10, params[:page])
    # end

    def create
        
        @notification = Notification.new(notification_params)

        if @notification.save
          send_notification(@notification)
          redirect_to admin_notifications_path
        else
          render :new
        end
    end

    # Define a custom finder by overriding the `find_resource` method:
    # def find_resource(param)
    #   Notification.find_by!(slug: param)
    # end

    # See https://administrate-docs.herokuapp.com/customizing_controller_actions
    # for more information

    def notification_params
        params.require(:notification).permit!
    end
  end
end
