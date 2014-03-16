# -*- encoding : utf-8 -*-
class InterventionsController < ApplicationController

  def create
    @schema = Schema.find(params[:category_id])

    @intervention = Intervention.new device_id: params[:device_id], phone_number: params[:phone_number], location_lat: params[:location].try(:[], :latitude), location_lgt: params[:location].try(:[], :longitude)
    @intervention.dump_params(params[:intervention])


    if @intervention.save
      render json: { 
        status: :success
      }
    else
      render json: {
        status: :error,
        errors: @intervention.errors.to_a 
      }
    end
  end
end
