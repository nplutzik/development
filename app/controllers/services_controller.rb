class ServicesController < ApplicationController

  before_action :require_authentication, only: [:index, :show, :update, :destroy]

  def index
    @services = Service.all.order(created_at: :desc)
  end

  def show
    @service = Service.find(params[:id])
  end

  def new
    @service = Service.new
  end

  def create
    @service = Service.new(service_params)
    @service.id = current_user
    if @service.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  private
  def service_params
    return params.require(:service).permit(:name, :address, :information)
  end


end
