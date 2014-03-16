class FieldValue < ActiveRecord::Base
  belongs_to :field
  belongs_to :intervention

  delegate :name, :to => :field, :allow_nil => true
  delegate :type, :to => :field, :allow_nil => true

  def as_json(options = {}, &block)
    methods = [ :name, :type ]
    super(options.merge({ :only => [ :value ], :methods => methods, :dasherize => false }), &block)
  end
end
