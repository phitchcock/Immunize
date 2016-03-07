# == Schema Information
#
# Table name: notifications
#
#  id         :integer          not null, primary key
#  title      :string
#  message    :string
#  created_at :datetime
#  updated_at :datetime
#

module NotificationsHelper
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
end
