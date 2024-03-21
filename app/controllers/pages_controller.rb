class PagesController < ApplicationController
  def home
    @album = RSpotify::Album.find("6Hs9pYq5ionwBpGAp6iqi9")
  end

  def search
    @search_query = params[:query]
    @artists = RSpotify::Artist.search(@search_query) if @search_query.present?
  end
end
