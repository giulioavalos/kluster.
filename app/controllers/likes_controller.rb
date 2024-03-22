class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @like = Like.new(like_params)
    @like.review = Review.find(params[:review_id])
    @like.user = current_user
    @album = Review.find(params[:review_id]).spotify_item_id
    if @like.save
      redirect_to album_path(@album)
    end
  end

  def destroy
    like = Like.find(params[:id])
    id = like.spotify_item_id
    like.destroy
    @album = Review.find(params[:review_id]).spotify_item_id
    redirect_to album_path(@album)
  end
end

private

def like_params
  params.require(:like).permit(:review_id)
end

# class FavoritesController < ApplicationController
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
