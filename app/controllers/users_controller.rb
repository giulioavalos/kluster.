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
      @user.avatar = @spotify_user.images.first.url
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

  def avatar_url
    spotify_user = RSpotify::User.find(:id)
    spotify_user.images.first['url'] if spotify_user.images.any?
  end

  def profile
    @user = current_user
    @reviews = @user.reviews
    @avatar_url = RSpotify::User.find(:id)
  end

  def update_avatar
    user = current_user
    avatars = fetch_avatars_from_spotify_api(user.spotify_id) # This is hypothetical, you should implement this method to fetch avatars from the Spotify API
    user.avatar = avatars.map(&:to_json)
    user.save
    redirect_to root_path
  end

  def follow(user)
    followed << user unless self == user || followed.include?(user)
  end

  def unfollow(user)
    followed.delete(user)
  end

  def following?(user)
    followed.include?(user)
  end
end
