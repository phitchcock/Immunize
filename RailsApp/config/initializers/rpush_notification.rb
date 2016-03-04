module Rpush
  module Client
    module ActiveModel
      module Notification
	def self.included(base)
	  base.instance_eval do
	    validates :alert, presence: true
            validates :data, presence: true
	  end
	end
      end
    end
  end
end
