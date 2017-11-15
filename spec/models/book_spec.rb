require 'rails_helper'

describe Book do
  it { should validate_presence_of :name }
  it { should validate_presence_of :bio }

  it 'should return sum of a single books reviews' do
    book = Book.create({name: "Book", bio: "String"})
    first_review = Review.create({rating: 2, review: "String", book_id: book.id})
    second_review = Review.create({rating: 2, review: "String cheese.", book_id: book.id})
    expect(book.find_average).to eq false
  end

  it 'should return popular books' do
    popular_book = Book.create({name: "Good book", bio: "Good read."})
    first_review = Review.create({rating: 4, review: "String", book_id: popular_book.id})
    second_review = Review.create({rating: 4, review: "String cheese.", book_id: popular_book.id})
    terrible_book = Book.create({name: "Bad book", bio: "Bad read."})
    third_review = Review.create({rating: 2, review: "String", book_id: terrible_book.id})
    fourth_review = Review.create({rating: 2, review: "String cheese.", book_id: terrible_book.id})
    both_books = [popular_book, terrible_book]
    expect(Book.most_popular(both_books)).to eq [popular_book]
  end

end
