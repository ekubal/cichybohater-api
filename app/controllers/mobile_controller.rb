class MobileController < ApplicationController

  def index
    if params.member?(:language) && params.member?(:location)
      @schemas = Schema.main.find_by_location(params[:location])

      render json: @schemas
    end
  end
end
