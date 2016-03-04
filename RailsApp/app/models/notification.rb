class Notification < Rpush::Apns::Notification
   validates_presence_of :alert
end
