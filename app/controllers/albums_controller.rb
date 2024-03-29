# app/controllers/albums_controller.rb
class AlbumsController < ApplicationController
  before_action :set_artist
  before_action :authenticate_spotify

  def index
    @albums = @artist.albums
  end

  def show
    @album = RSpotify::Album.find(params[:id])
    @tracks = @album.tracks
    @review = Review.new
    @reviews = Review.where(spotify_item_id: @album.id)
  rescue RestClient::BadRequest
    render file: "#{Rails.root}/public/404.html", layout: 'application', status: :not_found
  end

  #def recommendation
    #@recommendations = RSpotify::Recommendations.generate(seed_tracks: my_fav_albums.map(@user.id))
    #@recommendations = @recommendations.tracks.first(10)
  #end

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
