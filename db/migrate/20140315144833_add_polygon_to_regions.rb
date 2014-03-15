class AddPolygonToRegions < ActiveRecord::Migration
  def change
    add_column :regions, :polygon, :GEOMETRY
  end
end
