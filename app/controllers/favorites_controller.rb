class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    # album = Album.find(params[:album_id])
    # current_user.favorite_albums << album

    Favorite.create(user: current_user, album_id: params[:album_id]).save
    raise
  end

  def destroy
    album = current_user.favorites.find_by(album_id: params[:album_id]).album
    current_user.favorite_albums.delete(album)
  end
end
