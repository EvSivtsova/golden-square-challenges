require "track"

describe Track do
  context "initially" do
    it "constructs" do
      track = Track.new("title", "artist")
      expect(track.title).to eq "title"
      expect(track.artist).to eq "artist"
    end
  end

  context "when looking for keyword" do
    it "returns false if the track doesn't contains the keyword" do
      track = Track.new("title", "artist")
      expect(track.matches?("sky")).to eq false
    end

    it "returns true if the track contains the keyword" do
      track = Track.new("title", "artist")
      expect(track.matches?("art")).to eq true
      expect(track.matches?("titl")).to eq true
    end
  end
end