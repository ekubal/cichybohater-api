class Schema < ActiveRecord::Base
  belongs_to :parent_schema, class_name: 'Schema'
  has_many :children, foreign_key: 'parent_schema_id', class_name: 'Schema'
  has_many :fields
  has_many :organization_schemas
  has_many :organizations, through: :organization_schemas

  scope :main, -> { where(:parent_schema_id => nil) }


  def self.find_by_location(location)
    all
  end

  def as_json(options = {}, &block)
    methods = [ :children, :fields ]
    super(options.merge({ :except => [ :created_at, :updated_at, :parent_schema_id ], :methods => methods, :dasherize => false }), &block)
  end

end
