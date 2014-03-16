# -*- encoding : utf-8 -*-
class Hub < ActiveRecord::Base
  belongs_to :organization
  has_many :interventions
  has_many :users
end
