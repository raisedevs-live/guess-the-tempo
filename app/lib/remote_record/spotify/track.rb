require 'remote_record'
require_relative 'client'

module RemoteRecord
  module Spotify
    class Track < RemoteRecord::Base
      def get
        self.class.client(authorization).get("tracks/#{remote_resource_id}").body
      end

      def self.tempo_for(track, token:)
        client(token).get("audio-features/#{track.remote_resource_id}").body["tempo"]
      end

      def self.saved_tracks(token)
        client(token).get('me/tracks').body['items']
      end

      private

      def self.client(token)
        RemoteRecord::Spotify::Client.new(token)
      end
    end
  end
end
