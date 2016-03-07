# == Schema Information
#
# Table name: devices
#
#  id              :integer          not null, primary key
#  device_token    :string(64)
#  registration_id :string
#  created_at      :datetime
#  updated_at      :datetime
#

class Device < ActiveRecord::Base

  before_create :synch_id

  def synch_id
    self.registration_id = self.device_token
  end

end
