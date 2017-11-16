class ReviewsController < ApplicationController

  def show
    @book = Book.find(params[:book_id])
    @reviews = Review.find(params[:id])
  end

  def new
    @book = Book.find(params[:book_id])
    @review = @book.reviews.new
  end

  def create
    @book = Book.find(params[:book_id])
    @review = @book.reviews.new(review_params)
    if @review.save
      flash[:notice] = "Review has been saved!"
      redirect_to book_path(@book)
    else
      render :new
    end
  end

  def edit
    @book = Book.find(params[:book_id])
    @review = Review.find(params[:id])
  end

  def update
    @book = Book.find(params[:book_id])
    @review = Review.find(params[:id])
    if @review.update(review_params)
      flash[:notice] = "Your review has been updated!"
      redirect_to book_path(@book)
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:book_id])
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to book_path(@book)
  end

private
  def review_params
    params.require(:review).permit(:rating, :review, :name, :book_id)
  end

end
