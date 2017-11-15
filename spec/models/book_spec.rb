require 'rails_helper'

describe Book do
  it { should validate_presence_of :name }
  it { should validate_presence_of :bio }

  it 'should return sum of a single books reviews' do
    book = Book.create({name: "Book", bio: "String"})
    first_review = Review.create({rating: 2, review: "String", book_id: book.id})
    second_review = Review.create({rating: 2, review: "String cheese.", book_id: book.id})
    expect(book.find_average).to eq 2
  end


end
