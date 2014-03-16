# -*- encoding : utf-8 -*-
class AddPermalinkToField < ActiveRecord::Migration
  def self.up
    add_column :fields, :permalink, :string
    add_index :fields, :permalink
  end
  def self.down
    remove_column :fields, :permalink
  end
end
