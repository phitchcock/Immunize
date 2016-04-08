class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.string :street_number
      t.string :street_name
      t.string :city
      t.string :state
      t.string :zip
      t.date :date
      t.string :time

      t.timestamps null: false
    end
  end
end
