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
    return sum / ratings.length
  end


end
