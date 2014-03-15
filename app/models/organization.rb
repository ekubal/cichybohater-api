class Organization < ActiveRecord::Base
  has_many :organization_schemas
  has_many :schemas, through: :organization_schemas
  
  self.per_page = 10
end
