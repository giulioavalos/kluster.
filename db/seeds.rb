
# Destroy existing records
Favorite.destroy_all
Like.destroy_all
Reply.destroy_all
Review.destroy_all
User.destroy_all

# Create some users
user1 = User.create(email: 'user1@example.com', password: 'password1', avatar: 'https://i.pravatar.cc/150?img=1', name: 'Judy')
user2 = User.create(email: 'user2@example.com', password: 'password2', avatar: 'https://i.pravatar.cc/150?img=2', name: 'John')

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

# Assume these are the Spotify album IDs for demonstration purposes
spotify_album_ids = ['5kFjYk3umY8Pu1lymIJLVy', '3cQO7jp5S9qLBoIVtbkSM1', '621cXqrTSSJi1WqDMSLmbL', '0ku3S11VuwERVu81G7m0jv', '4pBreb9uc4GXiBi56yREY1']

review1.update(spotify_item_id: spotify_album_ids.sample, spotify_item_type: 'album')
review2.update(spotify_item_id: spotify_album_ids.sample, spotify_item_type: 'album')
review3.update(spotify_item_id: spotify_album_ids.sample, spotify_item_type: 'album')
review4.update(spotify_item_id: spotify_album_ids.sample, spotify_item_type: 'album')
review5.update(spotify_item_id: spotify_album_ids.sample, spotify_item_type: 'album')

puts "Seeded!"
