class Book < ActiveRecord::Base
  validates :name, :bio, :presence => true
  belongs_to :genres
  has_many :reviews
end
