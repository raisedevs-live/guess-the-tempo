Rails.application.config.middleware.use OmniAuth::Builder do
  provider :spotify, ENV.fetch("SPOTIFY_CLIENT_ID"), ENV.fetch("SPOTIFY_CLIENT_SECRET")
end
