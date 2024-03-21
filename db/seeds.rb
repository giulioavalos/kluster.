# db/seeds.rb

# Destroy existing records
Favorite.destroy_all
Like.destroy_all
Reply.destroy_all
Review.destroy_all
User.destroy_all

# Create some users
user1 = User.create(email: 'user1@example.com', password: 'password1')
user2 = User.create(email: 'user2@example.com', password: 'password2')

# Create some reviews
review1 = Review.create(user: user1, rating: 4, content: 'Great album!')
review2 = Review.create(user: user2, rating: 5, content: 'Amazing song!')
review3 = Review.create(user: user1, rating: 3, content: 'Decent track')
review4 = Review.create(user: user2, rating: 4, content: 'Nice beat')
review5 = Review.create(user: user1, rating: 5, content: 'Incredible lyrics')

# Create some likes
Like.create(user: user1, review: review2)
Like.create(user: user2, review: review1)
Like.create(user: user1, review: review3)
Like.create(user: user2, review: review4)
Like.create(user: user1, review: review5)

# Create some replies
Reply.create(user: user1, review: review2, content: 'I agree!')
Reply.create(user: user2, review: review1, content: 'Me too!')

puts "Seeded!"
