require "track"
require "music_library"

describe "integration" do
  context "when adding tracks to the library" do
    it "returns all the tracks" do
      music = MusicLibrary.new
      track_1 = Track.new("title_1", "artist_1")
      music.add(track_1)
      expect(music.all).to eq [track_1]
    end
  end
end 
