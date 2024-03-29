
# Destroy existing records
Following.destroy_all
Favorite.destroy_all
Like.destroy_all
Reply.destroy_all
Review.destroy_all
User.destroy_all

# Create some users
User.create(email: 'user3@example.com', password: '123456', avatar: 'https://i.pravatar.cc/150?img=3', name: 'Jane Smith')
User.create(email: 'user4@example.com', password: '123456', avatar: 'https://i.pravatar.cc/150?img=4', name: 'Michael Johnson')
User.create(email: 'user5@example.com', password: '123456', avatar: 'https://i.pravatar.cc/150?img=5', name: 'Emily Brown')
User.create(email: 'user6@example.com', password: '123456', avatar: 'https://i.pravatar.cc/150?img=6', name: 'David Martinez')
User.create(email: 'user7@example.com', password: '123456', avatar: 'https://i.pravatar.cc/150?img=7', name: 'Susan Lee')
User.create(email: 'user8@example.com', password: '123456', avatar: 'https://i.pravatar.cc/150?img=8', name: 'James Wilson')
User.create(email: 'user9@example.com', password: '123456', avatar: 'https://i.pravatar.cc/150?img=9', name: 'Lisa Taylor')
User.create(email: 'user10@example.com', password: '123456', avatar: 'https://i.pravatar.cc/150?img=10', name: 'Robert Anderson')
User.create(email: 'user11@example.com', password: '123456', avatar: 'https://i.pravatar.cc/150?img=11', name: 'Karen Thomas')
User.create(email: 'user12@example.com', password: '123456', avatar: 'https://i.pravatar.cc/150?img=12', name: 'Brian Jackson')
User.create(email: 'user13@example.com', password: '123456', avatar: 'https://i.pravatar.cc/150?img=13', name: 'Jessica White')
User.create(email: 'user14@example.com', password: '123456', avatar: 'https://i.pravatar.cc/150?img=14', name: 'Kevin Harris')
User.create(email: 'user15@example.com', password: '123456', avatar: 'https://i.pravatar.cc/150?img=15', name: 'Amanda Clark')
User.create(email: 'user16@example.com', password: '123456', avatar: 'https://i.pravatar.cc/150?img=16', name: 'Daniel Rodriguez')
User.create(email: 'user17@example.com', password: '123456', avatar: 'https://i.pravatar.cc/150?img=17', name: 'Patricia Lewis')
User.create(email: 'user18@example.com', password: '123456', avatar: 'https://i.pravatar.cc/150?img=18', name: 'Mark Robinson')
User.create(email: 'user19@example.com', password: '123456', avatar: 'https://i.pravatar.cc/150?img=19', name: 'Megan Walker')
User.create(email: 'user20@example.com', password: '123456', avatar: 'https://i.pravatar.cc/150?img=20', name: 'Steven Hall')

puts "Seeded!"
