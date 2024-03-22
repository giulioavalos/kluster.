class Review < ApplicationRecord
  belongs_to :user
  has_many :liked_by, through: :likes, source: :user
end
