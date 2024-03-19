class ArtistsController < ApplicationController
  def show
    @artist = RSpotify::Artist.find(params[:id])
  end
end
