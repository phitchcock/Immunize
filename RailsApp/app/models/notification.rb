class Notification < ActiveRecord::Base
  validates :title, :message, presence: true
  has_and_belongs_to_many :rpush_notifications,
                          class_name: "::Rpush::Apns::Notification",
                          association_foreign_key: :rpush_notification_id, dependent: :destroy
end
