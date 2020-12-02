# frozen_string_literal: true

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :spotify, ENV.fetch('SPOTIFY_CLIENT_ID'), ENV.fetch('SPOTIFY_CLIENT_SECRET'), scope: 'user-read-email user-library-read'
end
