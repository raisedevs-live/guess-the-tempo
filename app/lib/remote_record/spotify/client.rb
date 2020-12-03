module RemoteRecord
  module Spotify
    class Client
      delegate_missing_to :@client

      def initialize(token)
        @client = Faraday.new('https://api.spotify.com/v1/') do |conn|
          conn.request :json
          conn.response :json
          conn.use Faraday::Response::RaiseError
          conn.headers['Authorization'] = "Bearer #{token}"
        end
      end
    end
  end
end
