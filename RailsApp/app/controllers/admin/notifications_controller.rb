module Admin
  class NotificationsController < Admin::ApplicationController

    include NotificationsHelper

    def create
        @notification = Notification.new(notification_params)

        if @notification.save
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
