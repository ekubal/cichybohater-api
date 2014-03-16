# -*- encoding : utf-8 -*-
class CreateOrganizationSchemas < ActiveRecord::Migration
  def change
    create_table :organization_schemas do |t|
      t.references :organization, index: true
      t.references :schema, index: true

      t.timestamps
    end
  end
end
