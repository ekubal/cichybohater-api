class AddAttachmentBadgeToOrganizations < ActiveRecord::Migration
  def self.up
    change_table :organizations do |t|
      t.attachment :badge
    end
  end

  def self.down
    drop_attached_file :organizations, :badge
  end
end
