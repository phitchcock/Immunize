module Admin
  class NotificationsController < Admin::ApplicationController

    include SendNotification

    def create
      @notification = Notification.new(notification_params)

      if @notification.save
        send_notification(@notification)
        flash[:notice] = "Notification was successfully sent!"
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
