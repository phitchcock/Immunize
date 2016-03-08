class CreateNotificationsRpushNotifications < ActiveRecord::Migration
  def change
    create_table :notifications_rpush_notifications, id: false do |t|
      t.belongs_to :notification
      t.belongs_to :rpush_notification
    end

    add_index :notifications_rpush_notifications, :notification_id,
      name: :notifications_notification_id
    add_index :notifications_rpush_notifications, :rpush_notification_id,
      name: :notifications_rpush_id
  end
end
