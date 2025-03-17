class MagazinesController < ApplicationController
  def show_all
    if params[:search].present?
      @magazines = Magazine.where("title LIKE ?", "%#{params[:search]}%").page(params[:page]).per(20)
      if @magazines.empty?
        flash.now[:notice] = "Sorry, no results found."
      end
    else
      @magazines = Magazine.page(params[:page]).per(20)
    end
  end
  def show
    @magazine = Magazine.find(params[:id])
  end
end
