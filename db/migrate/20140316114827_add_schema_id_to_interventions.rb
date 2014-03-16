class AddSchemaIdToInterventions < ActiveRecord::Migration
  def change
    add_column :interventions, :schema_id, :integer, index: true
  end
end
