class Review < ActiveRecord::Base
  validates :rating, :review, :presence => true
  belongs_to :books
  scope :in_book, -> (book_id){ where("book_id = ?", book_id)}
  scope :recent_reviews, -> { where("created_at >= ?", (DateTime.now - 7.days)).order(created_at: :desc).limit(5)}

end
