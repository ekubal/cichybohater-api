class OrganizationRegion < ActiveRecord::Base
  belongs_to :organization
  belongs_to :region
end
