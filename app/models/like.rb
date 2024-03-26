class Like < ApplicationRecord
  belongs_to :user
  belongs_to :review, counter_cache: true
  validates :user_id, uniqueness: { scope: :review_id }
end
