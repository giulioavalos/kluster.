class LikesController < ApplicationController
  def create
    Like.create(user: current_user, spotify_item_id: params[:review_id], spotify_item_type: "review")
    redirect_to review_path(params[:review_id])
  end

  def destroy
    like = Like.find(params[:id])
    id = like.spotify_item_id
    like.destroy
    redirect_to review_path(id)
  end
end

# class FavoritesController < ApplicationController
#   before_action :authenticate_user!
#   def create
#     if params["album_id"].present?
#       Favorite.new(user: current_user, spotify_item_id: params[:album_id], spotify_item_type: "album").save
#       redirect_to album_path(params[:album_id])
#     else
#       Favorite.new(user: current_user, spotify_item_id: params[:artist_id], spotify_item_type: "artist").save
#       redirect_to artist_path(params[:artist_id])
#     end
#   end

#   def destroy
#     favorite = Favorite.find(params[:id])
#     id = favorite.spotify_item_id
#     favorite.destroy

#     if favorite.spotify_item_type == "album"
#       redirect_to album_path(id)
#     else
#       redirect_to artist_path(id)
#     end
#   end
# end
