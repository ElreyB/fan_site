require 'rails_helper'

describe Book do
  it { should validate_presence_of :name }
  it { should validate_presence_of :bio }

  # it 'should return sum of a single books reviews' do
  #   book = Book.create({name: "Book", bio: "String"})
  #   first_review = Review.create({rating: 2, review: "String", book_id: book.id})
  #   second_review = Review.create({rating: 2, review: "String cheese.", book_id: book.id})
  #   expect(book.find_average).to eq false
  # end
  #
  # it 'should return popular books' do
  #   popular_book = Book.create({name: "Good book", bio: "Good read."})
  #   first_review = Review.create({rating: 4, review: "String", book_id: popular_book.id})
  #   second_review = Review.create({rating: 4, review: "String cheese.", book_id: popular_book.id})
  #   terrible_book = Book.create({name: "Bad book", bio: "Bad read."})
  #   third_review = Review.create({rating: 2, review: "String", book_id: terrible_book.id})
  #   fourth_review = Review.create({rating: 2, review: "String cheese.", book_id: terrible_book.id})
  #   both_books = [popular_book, terrible_book]
  #
  #   expect(Book.most_popular(both_books)).to eq [popular_book]
  # end

  it 'should return popular user name' do
    book1 = Book.create({name: "Good book", bio: "Good read."})
    book2 = Book.create({name: "Fabulous book", bio: "Good read."})
    review1 = Review.create({rating: 2, review: "Sub-par book.", name: "Sam", book_id: book1.id})
    review2 = Review.create({rating: 3, review: "Decent read.", name: "Leophold", book_id: book1.id})
    review3 = Review.create({rating: 5, review: "Brilliant read.", name: "Sam", book_id: book2.id})
    expect(Book.find_popular_user).to eq "Sam"
  end

end
