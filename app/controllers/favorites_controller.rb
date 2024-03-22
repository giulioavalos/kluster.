class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    item_id = params[:album_id] || params[:artist_id]
    item_type = params[:album_id] ? 'Album' : 'Artist'
    favorite = Favorite.new(user: current_user, spotify_item_id: item_id, spotify_item_type: item_type)

    if favorite.save
      redirect_to path_based_on_type(item_type, item_id), notice: 'Added to favorites!'
    else
      redirect_to path_based_on_type(item_type, item_id), alert: 'Could not add to favorites.'
    end
  end

  def destroy
    favorite = current_user.favorites.find_by(id: params[:id])
    if favorite
      item_type = favorite.spotify_item_type
      item_id = favorite.spotify_item_id
      favorite.destroy
      redirect_to path_based_on_type(item_type, item_id), notice: 'Removed from favorites.'
    else
      redirect_back fallback_location: root_path, alert: 'Favorite not found or not yours to remove.'
    end
  end

  private

  def path_based_on_type(type, id)
    type == 'Album' ? album_path(id) : artist_path(id)
  end
end
