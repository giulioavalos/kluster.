class FollowingsController < ApplicationController
  def create
    user = User.find(params[:followed_user_id])
    current_user.follow(user)
    redirect_to user_profile_path(user)
  end

  def destroy
    follow = Following.find(params[:id])
    user = follow.followed_user
    #current_user.unfollow(user)
    follow.destroy
    redirect_to user_profile_path(user)
  end
end
