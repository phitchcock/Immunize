class Device < ActiveRecord::Base
  validates :device_token, uniqueness: true
end
