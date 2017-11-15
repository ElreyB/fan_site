Genre.destroy_all
Review.destroy_all
Book.destroy_all

10.times do |index|
  Genre.create!(name: Faker::Book.genre).books.create!(name: Faker::Book.title, bio: Faker::Lorem.paragraph).reviews.create!(rating: Faker::Number.between(1, 5), review: Faker::Lorem.paragraph)
end

p "Created #{Genre.count} genres"
p "Created #{Review.count} reviews"
p "Created #{Book.count} books"
