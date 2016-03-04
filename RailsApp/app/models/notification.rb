class Notification < ActiveRecord::Base
  validates :title, :message, presence: true
end
