# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @spotify_user = RSpotify::User.new(current_user.spotify_token)
    spotify_connection
  end

  private

  def spotify_connection
    return unless @spotify_user

    @spotify_connection = Faraday.new('https://api.spotify.com/v1/') do |conn|
      conn.request :json
      conn.response :json
      conn.use Faraday::Response::RaiseError
      conn.headers['Authorization'] = "Bearer #{@spotify_user.credentials.token}"
    end
  end
end
