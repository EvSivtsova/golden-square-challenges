require "music_library"

describe MusicLibrary do
  context "initially" do
    it "returns an empty array" do
      music = MusicLibrary.new
      expect(music.all).to eq []
    end
  end

  context "when adding tracks" do
    it "adds them to the library and returns them" do
      music = MusicLibrary.new
      fake_track = double(:fake_track, title: "title", artist: "artist")
      music.add(fake_track)
      expect(music.all).to eq [fake_track]
    end
  end
  
end