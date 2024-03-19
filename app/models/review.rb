class Review < ApplicationRecord
  belongs_to :user, :albums

end
