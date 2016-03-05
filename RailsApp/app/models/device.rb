class Device < ActiveRecord::Base

  before_create :synch_id

  def synch_id
    self.registration_id = self.device_token
  end

end
