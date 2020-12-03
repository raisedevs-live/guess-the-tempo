class CreateSpotifyTrackReferences < ActiveRecord::Migration[6.1]
  def change
    create_table :spotify_track_references do |t|
      t.string :remote_resource_id
      t.float :tempo

      t.timestamps
    end
  end
end
