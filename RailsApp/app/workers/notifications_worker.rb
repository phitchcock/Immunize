class NotificationsWorker
  include Sidekiq::Worker
  #include NotificationsHelper
  
  #sidekiq_options queue: "high"
  # sidekiq_options retry: false
  
  # def perform(notification)
  #   Device.all.each do |d|
  #     n = Rpush::Apns::Notification.new
  #     n.app = Rpush::Apns::App.find_by_name("iOSApp")
  #     n.device_token = d.device_token #64-character hex string
  #     n.alert = notification.message
  #     n.data = { data: notification.title }
  #     n.save!
  #   end
  # end
end