class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    Favorite.new(user: current_user, spotify_item_id: params[:album_id], spotify_item_type: "album").save
    redirect_to album_path(params[:album_id])
  end

  def destroy
    favorite = Favorite.find(params[:id])
    album_id = favorite.spotify_item_id
    favorite.destroy
    redirect_to album_path(album_id)
  end
end
