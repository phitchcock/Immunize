class Location < ActiveRecord::Base
   validates :name, :street_number, :street_name, :city, :state, 
              :zip, :date, :time, :info, presence: true

   geocoded_by :address
   after_validation :geocode

   def address
    ["#{street_number} #{street_name}", city, state, zip].compact.join(', ')
   end
end
