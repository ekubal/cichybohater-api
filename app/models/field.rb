# -*- encoding : utf-8 -*-
class Field < ActiveRecord::Base
  belongs_to :schema

  default_scope order(:element_order)
  has_permalink :name
  
  def self.inheritance_column 
    'inheritance_type'
  end

  def options
    self[:options].present? ? JSON::parse(self[:options]) : []
  end

  def as_json(options = {}, &block)
    super(options.merge({ :except => [ :created_at, :updated_at, :schema_id, :element_order ], :dasherize => false }), &block)
  end

end
