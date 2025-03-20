class BooksController < ApplicationController
  def index
    if params[:query].present?
      @books = Book.where("title ILIKE ?", "%#{params[:query]}%").includes(:magazines).page(params[:page]).per(10)
    else
      @books = Book.includes(:magazines).page(params[:page]).per(10)
    end
  end

  def show
    @book = Book.find(params[:id])
    @publisher = @book.publisher
    @reviews = @book.reviews
    @category = @book.category
    @magazines = @book.magazines
  end

  def show_all
    if params[:query].present?
      @books = Book.where("title ILIKE ?", "%#{params[:query]}%").page(params[:page]).per(10)
    else
      @books = Book.all.page(params[:page]).per(10)
    end
    Rails.logger.debug("Total Pages: #{@books.total_pages}")
  end
end
