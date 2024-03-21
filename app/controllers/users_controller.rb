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
      @user.save
      sign_up @user
      # :bypass is set to ignore devise related callbacks and only save the
      # user into session.
      sign_i @user, :bypass => true
      redirect_to root_path
    else
      @user = User.find_by(spotify_id: @spotify_user.uri)
      sign_in @user
      # :bypass is set to ignore devise related callbacks and only save the
      # user into session.
      sign_in @user, :bypass => true
      redirect_to root_path
    end
  end
end
