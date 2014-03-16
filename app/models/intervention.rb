# -*- encoding : utf-8 -*-
class Intervention < ActiveRecord::Base
  belongs_to :hub
  has_many :attachments
  has_many :field_values
  has_many :fields, through: :field_values

  before_create :build_field_values
  after_create :save_attachments

  attr_accessor :details

  ATTACHMENT_DIR = "#{Rails.root.to_s}/public/attachments/"
  def build_field_values
    @attachments = {}
    self.details ||= {}
    fields = Field.where(:permalink => self.details.keys).all.index_by(&:permalink)

    self.details.each_pair do |key ,value|
      if fields.member?(key)
        if fields[key].type == 'photo'
          filename = Digest::MD5.hexdigest(value)
          @attachments[filename] = value
          self.field_values.build(
            :value => filename,
            :field => fields[key]
          )
        else
          self.field_values.build(
            :value => value,
            :field => fields[key]
          )
        end
      end
    end
  end

  def save_attachments
    if @attachments.present?
      @attachments.each_pair do |fname,content|
        File.new("#{ATTACHMENT_DIR}#{fname}", 'w') { |f| f.write(content) }
      end
    end
    true
  end
end
