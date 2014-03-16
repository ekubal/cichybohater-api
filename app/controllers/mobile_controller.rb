# -*- encoding : utf-8 -*-
class MobileController < ApplicationController

  def index

    i = Intervention.last
    i.push_sockets
    render :json => 'x'
    return

    if params.member?(:language) && params.member?(:location)
      @schemas = Schema.main.find_by_location(params[:location])

      render_json @schemas
    end
  end
end
