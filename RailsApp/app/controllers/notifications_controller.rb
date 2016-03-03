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
    n.app = Rpush::Apns::App.find_by_name("iOSApp")
    n.device_token = "D3DFD081B9B311D145357B3CA433F472375E12CAE69283890BAFBC6EE5B54F29" # 64-character hex string
    n.alert = "hi mom!"
    n.data = { foo: :bar }
    n.save!
  end

end
