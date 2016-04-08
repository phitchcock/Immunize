class AddImageToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :image, :string
  end
end
