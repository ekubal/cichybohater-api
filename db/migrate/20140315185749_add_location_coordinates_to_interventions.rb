# -*- encoding : utf-8 -*-
class AddLocationCoordinatesToInterventions < ActiveRecord::Migration
  def change
    add_column :interventions, :location_lat, :float
    add_column :interventions, :location_lgt, :float
  end
end
