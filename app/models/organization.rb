# -*- encoding : utf-8 -*-
class Organization < ActiveRecord::Base
  has_many :organization_schemas
  has_many :schemas, through: :organization_schemas
  has_many :organization_regions
  has_many :regions, through: :organization_regions
  has_many :schedules
  has_many :hubs, through: :schedules
  
  self.per_page = 10

  has_attached_file :badge

  def badge_url
    "http://upload.wikimedia.org/wikipedia/commons/7/79/PolishPoliceEagle.png"
  end

  def as_json(options = {}, &block)
    methods = [ :badge_url ]
    super(options.merge({ :except => [ :created_at, :updated_at ], :methods => methods, :dasherize => false }), &block)
  end
end
