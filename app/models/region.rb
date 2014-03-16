# -*- encoding : utf-8 -*-
class Region < ActiveRecord::Base
  has_many :organization_regions
  has_many :organizations, through: :organization_regions
end
