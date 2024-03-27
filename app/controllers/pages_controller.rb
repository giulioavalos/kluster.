class PagesController < ApplicationController
  def home
    @reviews = Review.all
  end

  def search
    @search_query = params[:query]
    if @search_query.present?
      @artists = RSpotify::Artist.search(@search_query)
      @albums = RSpotify::Album.search(@search_query)
      @users = User.where("name LIKE ?", "%#{@search_query}%")
    end
  end
end
