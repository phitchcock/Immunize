class ChangeStreetNumberToIntLocations < ActiveRecord::Migration
  def change
    change_column :locations, :street_number, :integer
    change_column :locations, :zip, :integer
  end
end
