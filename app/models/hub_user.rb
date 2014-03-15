class HubUser < ActiveRecord::Base
  belongs_to :hub
  belongs_to :user
end
