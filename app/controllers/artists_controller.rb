class ArtistsController < ApplicationController
  def show
    @review = Review.new
    @reviews = Review.where(spotify_item_id: params[:id])
    @artist = RSpotify::Artist.find(params[:id])
    @albums = @artist.albums
    session[:selected_artist_id] = @artist.id
  rescue RestClient::BadRequest
    render file: "#{Rails.root}/public/404.html", layout: 'application', status: :not_found
  end
end
