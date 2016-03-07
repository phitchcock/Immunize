module Admin
  class NotificationsController < Admin::ApplicationController

    include NotificationsHelper
    #include NotificationsWorker

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
            #NotificationsWorker.perform_async(@notification)
            send_notification(@notification)
            redirect_to admin_notifications_path
        else
          render :new
        end
    end

    private

    def notification_params
        params.require(:notification).permit!
    end
  end
end
