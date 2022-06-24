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
      fake_track_2 = double(:fake_track, title: "title_2", artist: "artist_2")
      music.add(fake_track_2)
      expect(music.all).to eq [fake_track, fake_track_2]
    end
  end

  context "when searching tracks by keyword" do
    it "returns the tracks containing this keyword" do
      music = MusicLibrary.new
      track_1 = double(:fake_track_1, title: "I'm in love_1", artist:"Alex_1", matches?: true)
      music.add(track_1)
      track_2 = double(:fake_track_2, title: "Firebird_2", artist: "John_2", matches?: false)
      music.add(track_2)
      track_3 =  double(:fake_track_3, title:"Firebird_5", artist: "Love_band", matches?: true)
      music.add(track_3)
      expect( music.search("love") ).to eq [track_1, track_3]
    end
  end
  
end