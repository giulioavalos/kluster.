require 'rspotify'

class UsersController < ApplicationController
  RSpotify.authenticate(ENV['SPOTIFY_CLIENT_ID'], ENV['SPOTIFY_CLIENT_SECRET'])
  def spotify
    @user = User.new
    @spotify_user = RSpotify::User.new(request.env['omniauth.auth'])
    @user.spotify_id = @spotify_user.uri
    if User.find_by(spotify_id: @spotify_user.uri).nil?
      @user.name = @spotify_user.display_name
      @user.email = @spotify_user.email
      @user.birthdate = @spotify_user.birthdate
      @user.country = @spotify_user.country
      @user.save
      redirect_to user_path(@user)
    else
      @user = User.find_by(spotify_id: @spotify_user.uri)
      redirect_to user_path(@user)
    end
  end
end
