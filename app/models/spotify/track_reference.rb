require_relative '../../lib/remote_record/spotify/track'

class Spotify::TrackReference < ApplicationRecord
  belongs_to :user

  include RemoteRecord

  remote_record do |config|
    config.authorization { |record| record.user.spotify_token['credentials'].token }
  end
end
