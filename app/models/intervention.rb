class Intervention < ActiveRecord::Base
  belongs_to :hub
  #belongs_to :organization, through: :hub
  has_many :attachments

  def dump_params(params)
    params2 = {}
    fields = Field.where(:permalink => params.keys).all.index_by(&:permalink)
    params.each_pair do |key, value|
      if fields.member?(key)
        if fields[key].type == 'photo'
          self.attachments.build(:image => value)
        else
          params2[key] = value
        end
      end
    end
    self.details = JSON.dump(params2)
  end
end
