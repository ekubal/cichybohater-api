# -*- encoding : utf-8 -*-
class Schema < ActiveRecord::Base
  belongs_to :parent_schema, class_name: 'Schema'
  has_many :children, foreign_key: 'parent_schema_id', class_name: 'Schema'
  has_many :fields
  has_many :organization_schemas
  has_many :organizations, through: :organization_schemas
  has_many :organization_regions
  has_many :regions, through: :organization_regions
  has_many :interventions

  scope :main, -> { where(:parent_schema_id => nil) }

  attr_accessor :organization

  def self.find_by_location(location)
    schemas = Schema.joins(:organizations => :regions).where("CONTAINS(regions.polygon, GeomFromText('POINT(? ?)'))", location[:lat].to_f, location[:lgt].to_f).includes(:organizations)
    time = Time.now
    week_hour = time.wday * 24 + time.hour
    schemas = schemas.joins(:organizations => :schedules).includes(:organizations => :schedules).where('? BETWEEN 24 * start_day + start_hour AND 24 * end_day + end_hour', week_hour)
    schemas
  end

  def organization
    organizations.first
  end

  def schedule
    schedules.first
  end

  def as_json(options = {}, &block)
    methods = [ :children, :fields, :organization ]
    super(options.merge({ :except => [ :created_at, :updated_at, :parent_schema_id ], :methods => methods, :dasherize => false }), &block)
  end
end
