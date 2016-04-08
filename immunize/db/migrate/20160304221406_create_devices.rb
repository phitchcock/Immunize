class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.string :device_token, limit: 64
      t.string :registration_id

      t.timestamps
    end
    add_index :devices, :registration_id
  end
end
