class BooksController < ApplicationController

  def show
    @book = Book.find(params[:id])
  end

  def new
    @genre = Genre.find(params[:genre_id])
    @book = Book.new
  end

  def create
    @genre = Genre.find(params[:genre_id])
    @book = @genre.books.new(book_params)
    if @book.save
      flash[:notice] = "Your book has been saved!"
      redirect_to genre_path(@genre)
    else
      render :new
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(section_params)
      flash[:notice] = "Your book has been update!!!"
      redirect_to genre_books_path
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy_all
    redirect_to genres_path
  end

private

  def book_params
    params.require(:book).permit(:name, :bio, :genre_id)
  end
end
