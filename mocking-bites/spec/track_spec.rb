require "track"

describe Track do
  context "initially" do
    it "constructs" do
      track = Track.new("title", "artist")
      expect(track.title).to eq "title"
      expect(track.artist).to eq "artist"
    end
  end
end