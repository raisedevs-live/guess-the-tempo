# frozen_string_literal: true

class UsersController < ApplicationController
  def spotify
    redirect_to new_user_session_path, notice: 'Please sign in.' unless current_user.present?
    spotify_user = RSpotify::User.new(request.env['omniauth.auth'])
    current_user.update!(spotify_token: spotify_user.to_hash)
    redirect_to root_path, notice: 'You\'ve signed in with Spotify.'
  end
end
