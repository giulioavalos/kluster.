class FeedController < ApplicationController
  def index
    @feed_items = current_user.reviews
  end
end
