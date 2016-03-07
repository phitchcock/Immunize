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
end
