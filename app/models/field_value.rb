class FieldValue < ActiveRecord::Base
  belongs_to :field
  belongs_to :intervention
end
