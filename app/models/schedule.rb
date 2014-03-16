# -*- encoding : utf-8 -*-
class Schedule < ActiveRecord::Base
  belongs_to :organization
  belongs_to :hub
end
