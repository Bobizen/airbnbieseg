class ReviewsController < ApplicationController
  def new
    @review = Review.new
    @flat = Flat.find(params[:flat_id])
  end

  def index
    @reviews = Review.all
  end

  def create
    @flat = Flat.find(params[:flat_id])
    @review = Review.new(review_params)
    @review.flat = @flat
    @review.user = current_user

    if @review.save
      redirect_to flat_path(@flat), notice: "Review added successfully!"
    else
      render :new, status: :unprocessable_entity

    end
  end

  private

  def review_params
    params.require(:review).permit(:title, :comment, :score)
  end
end
