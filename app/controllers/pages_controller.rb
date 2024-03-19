class PagesController < ApplicationController
  def home
  end

  def home
    @search_query = params[:query]
    @artists = RSpotify::Artist.search(@search_query) if @search_query.present?
  end
end
