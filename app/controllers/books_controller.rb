class BooksController < ApplicationController
  def show_all
    def index
  if params[:query].present?
    @books = Book.where("title ILIKE ?", "%#{params[:query]}%")
  else
    @books = Book.all
  end
end
    if params[:search].present?
      @books = Book.includes(:magazines).where("title LIKE ?", "%#{params[:search]}%").page(params[:page]).per(10)
      if @books.empty?
        flash.now[:notice] = "Sorry, no results found."
      end
    else
      @books = Book.includes(:magazines).page(params[:page]).per(10)
    end
  end
  def show
    @book = Book.includes(:magazines).find(params[:id])
  end
end
