class ReviewsController < ApplicationController
  before_action :check_if_logged_in, only: [:create]

  def check_if_logged_in
    redirect_to login_path unless current_user
  end

  def create
    @book = Book.find(params[:book_id])
    @review = @book.reviews.build(review_params)
    @review.user = current_user  # Assign the current user to the review
    
    if @review.save
      redirect_to @book, notice: 'Review was successfully created.'
    else
      redirect_to @book, alert: 'There was an issue with your review.'
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :comment)
  end
end
