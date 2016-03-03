class NotificationsController < ApplicationController

  def create
    app = Rpush::Apns::App.new
    app.name = "iOSApp"
    app.certificate = File.read("lib/certs/sandbox.pem")
    app.environment = "sandbox" # APNs environment.
    app.password = ""
    app.connections = 1
    app.save!

    n = Rpush::Apns::Notification.new
    n.app = Rpush::Apns::App.find_by_name("ios_app")
    n.device_token = "" # 64-character hex string
    n.alert = "hi mom!"
    n.data = { foo: :bar }
    n.save!
  end

end
