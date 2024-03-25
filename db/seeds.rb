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

# Assume these are the Spotify album IDs for demonstration purposes
spotify_album_ids = ['5kFjYk3umY8Pu1lymIJLVy', '3cQO7jp5S9qLBoIVtbkSM1', '621cXqrTSSJi1WqDMSLmbL', '0ku3S11VuwERVu81G7m0jv', '4pBreb9uc4GXiBi56yREY1']

review1.update(spotify_item_id: spotify_album_ids.sample, spotify_item_type: 'album')
review2.update(spotify_item_id: spotify_album_ids.sample, spotify_item_type: 'album')
review3.update(spotify_item_id: spotify_album_ids.sample, spotify_item_type: 'album')
review4.update(spotify_item_id: spotify_album_ids.sample, spotify_item_type: 'album')
review5.update(spotify_item_id: spotify_album_ids.sample, spotify_item_type: 'album')

avatars = [
  'https://i.pravatar.cc/150?img=1',
  'https://i.pravatar.cc/150?img=2',
  'https://i.pravatar.cc/150?img=3',
  'https://i.pravatar.cc/150?img=4',
  'https://i.pravatar.cc/150?img=5',
  'https://i.pravatar.cc/150?img=6',
  'https://i.pravatar.cc/150?img=7',
  'https://i.pravatar.cc/150?img=8',
  'https://i.pravatar.cc/150?img=9',
  'https://i.pravatar.cc/150?img=10'
]
# Update user with ID 1
user1 = User.find(1)
user1.update(avatar: avatars.sample)
user1.update(name: 'Judy')

# Update user with ID 2
user2 = User.find(2)
user2.update(avatar: avatars.sample)
user2.update(name: 'John')

puts "Seeded!"
