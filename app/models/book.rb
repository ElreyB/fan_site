class Book < ActiveRecord::Base
  validates :name, :bio, :presence => true
  belongs_to :genres
  has_many :reviews

  scope :abc_sort, -> {order(name: :asc)}
  scope :oldest_first, -> { order(created_at: :asc)}
  scope :newest_first, -> { order(created_at: :desc)}

  def find_average
    ratings = Review.in_book(self.id)
    sum = 0
    ratings.each do |rating|
      sum = rating.rating += sum
    end
    if sum / ratings.length >= 4
      return true
    else
      return false
    end
  end

  def self.most_popular(books)
    popular_books = []
    books.each do |book|
      if book.find_average == true
        popular_books.push(book)
      end
    end
    return popular_books
  end

end
