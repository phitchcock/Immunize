class ChangeStreetNumberToIntLocations < ActiveRecord::Migration
  def change
    change_column :locations, :street_number, :string
    change_column :locations, :zip, :string
  end
end
