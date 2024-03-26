class ArtistsController < ApplicationController
  def show
    @artist = RSpotify::Artist.find(params[:id])
    session[:selected_artist_id] = @artist.id
  rescue RestClient::BadRequest
    render file: "#{Rails.root}/public/404.html", layout: 'application', status: :not_found
  end
end
