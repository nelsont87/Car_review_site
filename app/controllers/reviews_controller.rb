class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  def index
    @reviews = Review.order("created_at DESC").all
  end

  def show
  end

  def new
    @review = Review.new
  end

  def edit
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      redirect_to @review, notice: 'New review was successfully created'
    else
      render :new, notice: 'Could not create new review'
    end
  end
  def update
    if @review.update(review_params)
      redirect_to @review, notice: 'Review was successfully updated.'
    else
      render :edit, notice: 'Unable to update the review'
    end
  end
  def destroy
    @review.destroy
    redirect_to reviews_path, notice: 'review was successfully destroyed.'
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def review_params
      params.require(:review).permit(:title, :description)
    end
end
