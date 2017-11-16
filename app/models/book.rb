class Book < ActiveRecord::Base
  validates :name, :bio, :presence => true
  belongs_to :genres
  has_many :reviews

  scope :abc_sort, -> {order(name: :asc)}
  scope :oldest_first, -> { order(created_at: :asc)}
  scope :newest_first, -> { order(created_at: :desc)}

  def find_average
    ratings = Review.in_book(self.id)
    if ratings.length > 0
      sum = 0
      ratings.each do |rating|
        sum = rating.rating += sum
      end
      if (sum / ratings.length) >= 3
        return true
      else
        return false
      end
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

  def self.find_popular_user
    find_popular_name
  end

  def self.grab_user_reviews(name)
    reviews = Review.all
    reviews.select do |review|
      review.name == name
    end
  end

  def self.get_random_review(reviews)
    reviews[rand(reviews.length)]
  end

private

  def self.grab_names
    reviews = Review.all
    names = reviews.map do |review|
      review.name
    end
    names
  end

  def self.names_with_count
    names = grab_names
    names.reduce(Hash.new(0)) do |name_count, name|
      name_count[name] += 1
      name_count
    end
  end

  def self.find_popular_name
    names = names_with_count
    names.key(names.values.max)
  end
end
