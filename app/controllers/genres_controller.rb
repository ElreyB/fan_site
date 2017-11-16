class GenresController < ApplicationController

  def index
    @genres = Genre.all
    @books = Book.all
    @popular_books = Book.most_popular(@books)
    @random_genres = Genre.random_genre
    @popular_user = Book.find_popular_user
    @popular_user_reviews = Book.grab_user_reviews(@popular_user)
    @random_review = Book.get_random_review(@popular_user_reviews)
    @recent_reviews = Review.recent_reviews
    @random_genre = @random_genres.books[rand(@random_genres.books.length)]
  end

  def show
    @genre = Genre.find(params[:id])
  end


end
