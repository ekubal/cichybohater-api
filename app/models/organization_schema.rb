# -*- encoding : utf-8 -*-
class OrganizationSchema < ActiveRecord::Base
  belongs_to :organization
  belongs_to :schema
end
