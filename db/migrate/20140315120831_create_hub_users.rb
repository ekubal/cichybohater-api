class CreateHubUsers < ActiveRecord::Migration
  def change
    create_table :hub_users do |t|
      t.references :hub, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
