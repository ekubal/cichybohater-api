# -*- encoding : utf-8 -*-
class CreateHubs < ActiveRecord::Migration
  def change
    create_table :hubs do |t|
      t.references :organization, index: true
      t.string :url

      t.timestamps
    end
  end
end
