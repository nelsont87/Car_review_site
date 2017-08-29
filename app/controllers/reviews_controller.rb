class ReviewsController < ApplicationController
  before_action :set_review, only: [:show]

  def new
    @review = Review.new
  end

  def create
    @car = Car.find(params[:review][:car_id])
    @review = @car.reviews.build(review_params)

    if @review.save
      flash[:notice] = 'Review successfully added'
    else
      flash[:notice] = 'There was a problem with your review.'
    end

    render "cars/show"
  end

  def update
    if @review.update(review_params)
      redirect_to @review, notice: 'Review was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @review.destroy
    redirect_to reviews_url, notice: 'Review was successfully destroyed.'
  end

  private
    def set_review
      @review = Review.find(params[:id])
    end

    def review_params
      params.require(:review).permit(:description, :car_id)
    end
end
