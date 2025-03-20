class HomeController < ApplicationController
  # def index
  #   @books_with_magazines = Book.includes(:magazines).all
  # end
  # def index
  #   @books_with_magazines = Book.includes(:magazines).page(params[:page]).per(10)
  # end
  # def index
  #   if params[:search].present?
  #     @books_with_magazines = Book.includes(:magazines).where("title LIKE ?", "%#{params[:search]}%").page(params[:page]).per(10)
  #   else
  #     @books_with_magazines = Book.includes(:magazines).page(params[:page]).per(10)
  #   end
  # end
  # Adding display message
  # def index
  #   if params[:search].present?
  #     @books_with_magazines = Book.includes(:magazines).where("title LIKE ?", "%#{params[:search]}%").page(params[:page]).per(10)
  #     if @books_with_magazines.empty?
  #       flash.now[:notice] = "Sorry, no results found."
  #     end
  #   else
  #     @books_with_magazines = Book.includes(:magazines).page(params[:page]).per(10)
  #   end
  # end
  # Adding heirahical search 
  # def index
  #   @books = Book.all
  #   @magazines = Magazine.all

  #   if params[:search].present?
  #     @books_with_magazines = Book.includes(:magazines).where("title LIKE ?", "%#{params[:search]}%").page(params[:page]).per(10)
  #     if @books_with_magazines.empty?
  #       flash.now[:notice] = "Sorry, no results found."
  #     end
  #   else
  #     @books_with_magazines = Book.includes(:magazines).page(params[:page]).per(10)
  #   end
  # end
  def index
    @magazines = Magazine.all
    @books_with_magazines = Book.includes(:magazines)

    if params[:search].present?
      @books_with_magazines = @books_with_magazines.where("books.title ILIKE ?", "%#{params[:search]}%")
    end

    if params[:magazine_id].present?
      @books_with_magazines = @books_with_magazines.joins(:magazines).where(magazines: { id: params[:magazine_id] }).distinct
    end

    if @books_with_magazines.empty?
      flash.now[:notice] = "Sorry, no results found."
    end

    @books_with_magazines = @books_with_magazines.page(params[:page]).per(10)
  end
end
