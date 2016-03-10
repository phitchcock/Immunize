# == Schema Information
#
# Table name: locations
#
#  id            :integer          not null, primary key
#  name          :string
#  street_number :string
#  street_name   :string
#  city          :string
#  state         :string
#  zip           :string
#  date          :string
#  time          :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  info          :text
#

class Location < ActiveRecord::Base
   validates :name, :street_number, :street_name, :city, :state, :zip, :date, :time, :info, presence: true

   geocoded_by :address
   after_validation :geocode

   def address
    ["#{street_number} #{street_name}", city, state, zip].compact.join(', ')
   end
end
