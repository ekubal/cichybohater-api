class Organization < ActiveRecord::Base
  has_many :organization_schemas
  has_many :schemas, through: :organization_schemas
  has_many :organization_regions
  has_many :regions, through: :organization_regions
  has_many :schedules
  has_many :hubs, through: :schedules
  
  self.per_page = 10
end
