# -*- encoding : utf-8 -*-
class AddDeviceInfosToInterventions < ActiveRecord::Migration
  def change
    add_column :interventions, :device_id, :string
    add_column :interventions, :phone_number, :string
  end
end
