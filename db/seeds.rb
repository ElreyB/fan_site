Genre.destroy_all

10.times do |index|
  Genre.create!(name: Faker::Book.genre)
end

p "Created #{Genre.count} genres"
