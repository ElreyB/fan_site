class Genre < ActiveRecord::Base
  validates :name, :presence => true
  has_many :books

  def self.random_genre
    genres = Genre.all
    random_genre = genres[rand(genres.length)]
    random_genre
  end

end
