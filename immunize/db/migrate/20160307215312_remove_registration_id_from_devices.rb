class RemoveRegistrationIdFromDevices < ActiveRecord::Migration
  def change
    remove_column :devices, :registration_id
  end
end
