class ImagesController < ApplicationController

  def show
    if File.exists?(Intervention::ATTACHMENT_DIR + params[:id])
      original = Magick::Image.read(Intervention::ATTACHMENT_DIR + params[:id]).first

      image = original
      if params.member?(:size)
        w, h = params[:size].split('x', 2)
        image.resize!(w.to_i, h.to_i)
      end
      tmpfile = Tempfile.new(params[:id])
      image.write(tmpfile.path)
      send_data tmpfile.read, :type => image.mime_type, :disposition => 'inline'
    else
      raise ActiveRecord::RecordNotFound
    end
  end
end
