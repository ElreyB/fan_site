Genre.destroy_all
Review.destroy_all
Book.destroy_all

10.times do |index|
  genre = Genre.create!(name: Faker::Book.genre, created_at: Faker::Date.between_except(1.year.ago, 1.year.from_now, 21.days.ago))

  5.times do |index|
    books = genre.books.create!(name: Faker::Book.title, bio: Faker::Lorem.paragraph, author: Faker::Book.author, created_at: Faker::Date.between_except(1.year.ago, 1.year.from_now, 21.days.ago))

    7.times do |index|
      books.reviews.create!(rating: Faker::Number.between(1, 5), review: Faker::Lorem.paragraph(3), name: Faker::Name.name, created_at: Faker::Date.between_except(1.year.ago, 1.year.from_now, 21.days.ago))
    end
  end
end

p "Created #{Genre.count} genres"
p "Created #{Review.count} reviews"
p "Created #{Book.count} books"
