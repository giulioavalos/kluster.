class PagesController < ApplicationController
  def home
  end

  def search
    @search_query = params[:query]
    @artists = RSpotify::Artist.search(@search_query) if @search_query.present?
  end
end
