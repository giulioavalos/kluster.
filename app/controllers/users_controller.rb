require 'rspotify'

class UsersController < ApplicationController
  RSpotify.authenticate(ENV['SPOTIFY_CLIENT_ID'], ENV['SPOTIFY_CLIENT_SECRET'])
  def spotify
    @user = User.new
    @spotify_user = RSpotify::User.new(request.env['omniauth.auth'])
    @user.spotify_id = @spotify_user.uri
    if User.find_by(spotify_id: @spotify_user.uri).nil?
      @user.name = @spotify_user.display_name
      @user.password = "kluster"
      @user.email = @spotify_user.email
      @user.birthdate = @spotify_user.birthdate
      @user.country = @spotify_user.country
      @user.avatars = @spotify_user.images
      @user.save
      sign_in @user
      sign_in @user, :bypass => true
      redirect_to root_path
    else
      @user = User.find_by(spotify_id: @spotify_user.uri)
      sign_in @user
      sign_in @user, :bypass => true
      redirect_to root_path
    end
  end
  def update_avatar
    user = current_user
    avatars = fetch_avatars_from_spotify_api(user.spotify_id) # This is hypothetical, you should implement this method to fetch avatars from the Spotify API
    user.avatars = avatars.map(&:to_json)
    user.save
    redirect_to root_path
  end
end
