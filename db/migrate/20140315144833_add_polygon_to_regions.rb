# -*- encoding : utf-8 -*-
class AddPolygonToRegions < ActiveRecord::Migration
  def change
    add_column :regions, :polygon, :GEOMETRY
  end
end
