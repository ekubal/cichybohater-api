# -*- encoding : utf-8 -*-
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session


  def current_user
    User.first
  end

  def render_json(data)
    if params.member?(:callback)
      render text: "#{params[:callback]}(#{data.to_json})"
    else
      render json: data
    end
  end
end
