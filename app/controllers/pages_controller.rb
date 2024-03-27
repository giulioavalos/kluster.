class PagesController < ApplicationController
  def home
    @reviews = Review.where(user: User.where(id: Following.where(follower_id: current_user.id).map{ |f| f.followed_user_id }))
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
