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
    review = like.review
    album = review.spotify_item_id
    like.destroy
    redirect_to album_path(album)
  end

  private

  def like_params
    params.require(:like).permit(:review_id)
  end
end
