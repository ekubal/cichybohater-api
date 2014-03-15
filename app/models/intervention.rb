class Intervention < ActiveRecord::Base
  belongs_to :hub

  def dump_params(params)
    self.details = JSON.dump(params) if params.present?
  end
end
