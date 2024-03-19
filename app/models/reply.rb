class Reply < ApplicationRecord
  belongs_to :user
  belongs_to :review

  validates :content, presence: true
end
