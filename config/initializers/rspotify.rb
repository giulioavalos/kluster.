
unless ENV['SPOTIFY_CLIENT_ID'] && ENV['SPOTIFY_CLIENT_SECRET']
  raise "Missing Spotify credentials. Add SPOTIFY_CLIENT_ID and SPOTIFY_CLIENT_SECRET to your .env file."
end

RSpotify.authenticate(ENV['SPOTIFY_CLIENT_ID'], ENV['SPOTIFY_CLIENT_SECRET'])
