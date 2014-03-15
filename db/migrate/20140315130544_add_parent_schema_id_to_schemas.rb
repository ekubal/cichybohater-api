class AddParentSchemaIdToSchemas < ActiveRecord::Migration
  def change
    add_column :schemas, :parent_schema_id, :integer, index: true
  end
end
