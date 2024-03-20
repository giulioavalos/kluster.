class Album < ApplicationRecord
  belongs_to :artist
  has_many :reviews, dependent: :destroy
  validates :title, presence: true
end
