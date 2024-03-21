class ReviewsController < ApplicationController
  before_action :set_review, only: %i[index show edit update destroy]

  def index
    @reviews = Review.all
  end

  def create
    @review = Review.new(review_params)
    @review.user = current_user
    respond_to do |format|
      if @review.save
        format.html { redirect_to album_path(@review.spotify_item_id), notice: 'Review was successfully created.', anchor: "review_section" }
      else
        format.html { render :new }
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
    params.require(:review).permit(:rating, :content, :spotify_item_id, :spotify_item_type)
  end
end
