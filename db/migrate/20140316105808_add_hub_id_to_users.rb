class AddHubIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :hub_id, :integer, index: true
  end
end
