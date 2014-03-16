class CreateFieldValues < ActiveRecord::Migration
  def change
    create_table :field_values do |t|
      t.references :field, index: true
      t.references :intervention, index: true
      t.string :value

      t.timestamps
    end
  end
end
