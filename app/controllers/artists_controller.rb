class ArtistsController < ApplicationController
  def show
    @artist = RSpotify::Artist.find(params[:id])
    session[:selected_artist_id] = @artist.id
  end
end
