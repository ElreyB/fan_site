class Review < ActiveRecord::Base
  validates :rating, :review, :presence => true
  belongs_to :books
  scope :in_book, -> (book_id){ where("book_id = ?", book_id)}


end
