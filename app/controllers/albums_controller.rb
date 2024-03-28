# app/controllers/albums_controller.rb
class AlbumsController < ApplicationController
  before_action :set_artist
  before_action :authenticate_spotify

  def index
    @albums = @artist.albums
  end

  def show
    item_id = params[:album_id] || params[:artist_id]
    item_type = params[:album_id] ? 'Album' : 'Artist'
    if item_type == 'Artist'
      @album = RSpotify::Artist.find(item_id)
      @review = Review.new
    else item_type = 'Album'
     @album = RSpotify::Album.find(item_id)
     @tracks = @album.tracks
      @review = Review.new
    end
  rescue RestClient::BadRequest
    render file: "#{Rails.root}/public/404.html", layout: 'application', status: :not_found
  end

  private

  def set_artist
    @artist = RSpotify::Artist.find(session[:selected_artist_id])
  end

  def set_album
    session[:selected_album_id] = params[:id]
  end

  def authenticate_spotify
    RSpotify.authenticate(ENV['SPOTIFY_CLIENT_ID'], ENV['SPOTIFY_CLIENT_SECRET'])
  end
end
