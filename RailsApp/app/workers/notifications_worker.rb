class NotificationsWorker
  include Sidekiq::Worker
  include NotificationsHelper
  
  #sidekiq_options queue: "high"
  # sidekiq_options retry: false
  
  def perform(notification)
    send_notification(notification)
  end
end