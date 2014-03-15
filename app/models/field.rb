class Field < ActiveRecord::Base
  belongs_to :schema

  default_scope order(:element_order)
  
  def self.inheritance_column 
    'inheritance_type'
  end

  def as_json(options = {}, &block)
    super(options.merge({ :except => [ :created_at, :updated_at, :schema_id, :element_order ], :dasherize => false }), &block)
  end

end
