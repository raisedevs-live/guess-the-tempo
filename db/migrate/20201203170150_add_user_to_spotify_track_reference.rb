class AddUserToSpotifyTrackReference < ActiveRecord::Migration[6.1]
  def change
    add_reference :spotify_track_references, :user, null: false, foreign_key: true
  end
end
