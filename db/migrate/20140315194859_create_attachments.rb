# -*- encoding : utf-8 -*-
class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.references :intervention, index: true
      t.references :field, index: true

      t.timestamps
    end
  end
end
