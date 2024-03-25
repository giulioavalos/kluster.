class User < ApplicationRecord
  has_many :reviews
  has_many :likes
  has_many :like_reviews, through: :likes, source: :review

  has_many :favorites
  has_many :favorite_albums, through: :favorites, source: :album
  serialize :avatars, JSON

  has_many :followings, foreign_key: :follower_id

  has_many :followed_relationships, foreign_key: :follower_id, class_name: 'Following'
  has_many :followeds, through: :followed_relationships, source: :followed

  has_many :follower_relationships, foreign_key: :followed_id, class_name: 'Following'
  has_many :followers, through: :follower_relationships, source: :follower

  def following?(other_user)
    followed_relationships.exists?(followed_user_id: other_user.id)
  end

  def follow(other_user)
    followed_relationships.create(followed_user_id: other_user.id)
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
