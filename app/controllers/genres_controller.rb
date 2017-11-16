class GenresController < ApplicationController

  def index
    @genres = Genre.all
    @books = Book.all
    @popular_books = Book.most_popular(@books)
    @random_genre = Genre.random_genre
    @popular_user = Book.find_popular_user
  end

  def show
    @genre = Genre.find(params[:id])
  end


end
