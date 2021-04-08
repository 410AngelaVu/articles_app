# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(
  name: 'author',
  email: 'author122@test.com',
  password: 'password@1',
  is_author: true
)

# Create a Normal user
User.create!(
  name: 'user',
  email: 'user1221@test.com',
  password: 'password@1',
  is_author: false
)

3.times do |i|
  Article.create!(title: "Hello World#{i}", body: "Little Article #{i}", author_id: 1)
end