class PublishersController < ApplicationController
    def show
      @publisher = Publisher.find(params[:id])
      @books = @publisher.books # Fetch all books by the publisher
    end
  end