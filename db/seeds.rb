
# Destroy existing records
Following.destroy_all
Favorite.destroy_all
Like.destroy_all
Reply.destroy_all
Review.destroy_all
User.destroy_all

# Create some users
user1 = User.create(email: 'user1@example.com', password: '123456', avatar: 'https://i.pravatar.cc/150?img=1', name: 'Judy')
user2 = User.create(email: 'user2@example.com', password: '123456', avatar: 'https://i.pravatar.cc/150?img=2', name: 'John Doe')

# Create 10 more users
10.times do |i|
  User.create(email: "user#{i + 3}@example.com", password: "123456", avatar: "https://i.pravatar.cc/150?img=#{i + 3}", name: "User #{i + 3}")
end

puts "Seeded!"
