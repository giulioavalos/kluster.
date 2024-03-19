class UsersController < ApplicationController
  def callback
    @spotify_user = RSpotify::User.new(request.env['omniauth.auth'])
    if User.find_by(spotify_id: @spotify_user.spotify_id).nil?
      @user = User.new
      @user.spotify_id = @spotify_user.spotify_id
      @user.name = @spotify_user
      @user.save
      Devise::login(@user)
    else
      @user = User.find_by(spotify_id: @spotify_user.spotify_id)
      Devise::login(@user)
    end
  end
end


current_user.reviews
