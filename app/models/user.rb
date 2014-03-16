# -*- encoding : utf-8 -*-
class User < ActiveRecord::Base
  belongs_to :hub
  belongs_to :organization

  delegate :interventions, to: :hub, allow_nil: true
end
