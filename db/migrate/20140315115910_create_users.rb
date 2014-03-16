# -*- encoding : utf-8 -*-
class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.integer :status
      t.string :password, limit: 45
      t.string :salt, limit: 45

      t.timestamps
    end
  end
end
