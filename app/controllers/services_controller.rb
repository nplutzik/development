class SongsController < ApplicationController

  before_action(:require_authentication)
  before_action(:require_authentication, only [:new, :create, :edit, :update, :destroy])

  def index
    @services = Service.all
  end

  def my_index
    @services = current_user.services
  end

  def show
    @service = Service.find(params[:id])
  end

  def new
    @service = Service.new
  end

  def create
    @service = Service.new(song_params)

    if @service.save
      redirect_to service_path(@service)
    else
      render :new
    end
  end

  def edit
    @service = Service.find(params[:id])
  end

  def update
    @service = Service.find(params[:id])
    @service.update(service_params)
    redirect_to service_path(@service)
  end

  def destroy
    @service = Service.find(params[:id])
    @service.destroy
    redirect_to services_path
  end

  def search
    packaged_services = Song.services_search(params[:query])
    @services = packaged_services.map do |song|
      {
        services_service_id: service[:services_service_id],
        service: service[:service],
      }
    end
  end

#   def quickadd
#     @song = Song.itunes_lookup(params[:itunes_song_id])
#     @song[:song].artist = Artist.find_by(name: @song[:itunes_artist_iname]) || Artist.create(name: @song[:itunes_artist_name])
#     @song[:song].price ||= Song.default_price
#     @song[:song].save
#     redirect_to songs_path
#   end

#   private
#   def song_params
#     params.require(:song).permit(:title, :album, :genre, :preview_link, :artwork_url, :artist_id)
#   end
# end
