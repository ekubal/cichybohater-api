# -*- encoding : utf-8 -*-
class Intervention < ActiveRecord::Base
  belongs_to :hub
  belongs_to :schema
  has_many :attachments
  has_many :field_values
  has_many :fields, through: :field_values

  before_create :build_field_values
  after_create :save_attachments
  after_create :push_sockets
  ATTACHMENT_DIR = "#{Rails.root.to_s}/public/attachments/"

  attr_accessor :field_params
  alias_method :details, :field_values

  delegate :label, to: :schema, allow_nil: true

  self.per_page = 20

  def build_field_values
    @attachments = {}
    self.field_params ||= {}
    fields = Field.where(:permalink => self.field_params.keys).all.index_by(&:permalink)

    self.field_params.each_pair do |key ,value|
      if fields.member?(key)
        if fields[key].type == 'photo'
          filename = Digest::MD5.hexdigest("#{Time.now.to_i}-#{value}")
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
        File.open("#{ATTACHMENT_DIR}#{fname}", 'w') { |f| f.write(content) }
      end
    end
    true
  end

  def location
    { :lat => self.location_lat, :lgt => self.location_lgt }
  end

  def when
    self.created_at.to_i
  end

  def as_json(options = {}, &block)
    methods = [ :details, :location, :when, :label ]
    super(options.merge({ :only => [ :id, :status ], :methods => methods, :dasherize => false }), &block)
  end

  def push_sockets
    WebsocketRails["hub-sock-#{self.hub_id}"].trigger(:intervention, self.as_json)
  end
end
