# -*- encoding : utf-8 -*-
class CreateOrganizationRegions < ActiveRecord::Migration
  def change
    create_table :organization_regions do |t|
      t.references :organization, index: true
      t.references :region, index: true

      t.timestamps
    end
  end
end
