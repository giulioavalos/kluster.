class User < ApplicationRecord
  has_many :reviews
  has_many :favorites
  has_many :favorite_albums, through: :favorites, source: :album
  serialize :avatars, JSON

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
