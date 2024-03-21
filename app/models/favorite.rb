class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :album

  validates :content, presence: true
end
