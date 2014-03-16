# -*- encoding : utf-8 -*-
class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.references :organization, index: true
      t.references :hub, index: true
      t.string :name
      t.integer :start_day
      t.integer :end_day
      t.integer :start_hour
      t.integer :end_hour
      t.string :type, limit: 45
      t.text :fallback

      t.timestamps
    end
  end
end
