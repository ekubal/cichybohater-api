class CreateSchemas < ActiveRecord::Migration
  def change
    create_table :schemas do |t|
      t.string :label
      t.text :description

      t.timestamps
    end
  end
end
