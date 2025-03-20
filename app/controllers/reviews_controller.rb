class ReviewsController < ApplicationController
    before_action :set_book_or_magazine
  
    def create
      @review = @item.reviews.build(review_params)
      @review.user = current_user # Assuming you're using authentication to track who submits the review
      
      if @review.save
        redirect_to @item, notice: 'Review added successfully!'
      else
        redirect_to @item, alert: 'Unable to add review.'
      end
    end
  
    private
  
    def set_book_or_magazine
      @item = if params[:book_id]
                Book.find(params[:book_id])
              elsif params[:magazine_id]
                Magazine.find(params[:magazine_id])
              end
    end
  
    def review_params
      params.require(:review).permit(:rating, :comment)
    end
  end
  