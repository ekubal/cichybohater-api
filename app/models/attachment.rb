class Attachment < ActiveRecord::Base
  belongs_to :intervention
  belongs_to :field

  has_attached_file :image

  def image_path(size = :original)
    self.image(size).to_s
  end
end
