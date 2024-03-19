class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  # POST /reviews
  def create
    @review = Review.new(review_params)
    @review.album_id = params[:album_id] # Assurez-vous d'avoir l'album_id

    if @review.save
      redirect_to @review.album, notice: 'Review was successfully created.'
    else
      render :new
    end
  end

  # GET /reviews/1
  def show
  end

  # GET /reviews/1/edit
  def edit
  end

  # PATCH/PUT /reviews/1
  def update
    if @review.update(review_params)
      redirect_to @review.album, notice: 'Review was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /reviews/1
  def destroy
    @review.destroy
    redirect_to albums_url, notice: 'Review was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_review
    @review = Review.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def review_params
    params.require(:review).permit(:rating, :content, :album_id) # Assurez-vous que :album_id est autorisé si nécessaire
  end
end
