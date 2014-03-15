class CreateInterventions < ActiveRecord::Migration
  def change
    create_table :interventions do |t|
      t.references :hub, index: true
      t.integer :status
      t.text :details, limit: 4.gigabytes - 1

      t.timestamps
    end
  end
end
