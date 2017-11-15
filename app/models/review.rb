class Review < ActiveRecord::Base
  validates :rating, :review, :presence => true
  belongs_to :books
end
