require "track"
require "music_library"

describe "integration" do
  context "when adding tracks to the library" do
    it "returns all the tracks" do
      music = MusicLibrary.new
      track_1 = Track.new("title_1", "artist_1")
      music.add(track_1)
      track_2 = Track.new("title_2", "artist_2")
      music.add(track_2)
      expect(music.all).to eq [track_1, track_2]
    end
  end

  context "when searching tracks by keyword" do
    it "returns the tracks containing this keyword" do
      music = MusicLibrary.new
      track_1 = Track.new("I'm in love_1", "Alex_1")
      music.add(track_1)
      track_2 = Track.new("Firebird_2", "John_2")
      music.add(track_2)
      track_3 = Track.new("Firebird_5", "Love_band")
      music.add(track_3)
      expect( music.search("love") ).to eq [track_1, track_3]
    end
  end
end 
