class Album < ApplicationRecord
  belongs_to :artist
  has_many :reviews, dependent: :destroy
  has_many :favorites
  has_many :favorited_by, through: :favorites, source: :user
  validates :title, presence: true
end
