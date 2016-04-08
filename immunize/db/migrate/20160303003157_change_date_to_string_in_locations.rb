class ChangeDateToStringInLocations < ActiveRecord::Migration
  def change
    change_column :locations, :date, :string
    add_column :locations, :info, :text
  end
end
