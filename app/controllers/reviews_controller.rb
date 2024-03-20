class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  def create
    @album = RSpotify::Album.find(params[:id])
    if @album
      @review = @album.reviews.build(review_params)
      respond_to do |format|
        if @review.save
          format.html { redirect_to @album, notice: 'Review was successfully created.' }
        else
          format.html { render :new }
        end
      end
    end
  end

  def show
  end

  def edit
  end

  def update
    if @review.update(review_params)
      redirect_to @review.album, notice: 'Review was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @review.destroy
    redirect_to albums_url, notice: 'Review was successfully destroyed.'
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
