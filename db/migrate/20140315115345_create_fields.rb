# -*- encoding : utf-8 -*-
class CreateFields < ActiveRecord::Migration
  def change
    create_table :fields do |t|
      t.references :schema, index: true
      t.string :name
      t.integer :element_order
      t.string :label
      t.text :description
      t.boolean :required
      t.string :type, limit: 45
      t.text :options
      t.boolean :remember

      t.timestamps
    end
  end
end
