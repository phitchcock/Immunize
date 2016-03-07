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

class Notification < ActiveRecord::Base
  validates :title, :message, presence: true
end
