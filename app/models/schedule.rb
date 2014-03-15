class Schedule < ActiveRecord::Base
  belongs_to :organization
  belongs_to :hub
end
