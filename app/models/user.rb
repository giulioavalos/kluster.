class User < ApplicationRecord
  has_many :reviews
<<<<<<< HEAD
  has_many :favorites
  has_many :favorite_albums, through: :favorites, source: :album
  serialize :avatars, JSON

=======
  has_many :feed_items
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
>>>>>>> 3f24e986f8f5f237c6a0c860a6e2a174b4a46af6
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
