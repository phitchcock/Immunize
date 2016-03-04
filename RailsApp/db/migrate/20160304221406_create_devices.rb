class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.string :device_token, limit: 64

      t.timestamps
    end
  end
end
