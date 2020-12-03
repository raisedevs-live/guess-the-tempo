# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    tracks = RemoteRecord::Spotify::Track.saved_tracks(current_user.spotify_token['credentials'].token)
    @tracks = tracks.map { |t| Spotify::TrackReference.find_or_create_by(remote_resource_id: t['track']['id'], user: current_user) }
  end
end
