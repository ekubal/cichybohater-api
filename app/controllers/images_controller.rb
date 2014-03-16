class ImagesController < ApplicationController

  def show
    original = Magick::Image.read(Intervention::ATTACHMENT_DIR + params[:id]).first

    image = original
    if params.member?(:size)
      w, h = params[:size].split('x', 2)
      image.resize!(w.to_i, h.to_i)
    end
    response.headers['Cache-Control'] = "public, max-age=#{12.hours.to_i}"
    response.headers['Content-Type'] = image.mime_type
    response.headers['Content-Disposition'] = 'inline'
    tmpfile = Tempfile.new(params[:id])
    image.write(tmpfile.path)
    send_data tmpfile.read, :type => image.mime_type, :x_sendfile => true 
  end
end
