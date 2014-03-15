class OrganizationsController < ApplicationController
  def index
    @organizations = Organization.order(:name).page(params[:page])
    @organizations = @organizations.where(:name.like => "%#{params[:name]}%") if params.member?(:name)

    render json: { items: @organizations, total_pages: @organizations.total_pages }
  end

  def show
    @organization = Organization.find(params[:id])
    render json: @organization
  end

  def create
    
  end

  def update
  end
end
