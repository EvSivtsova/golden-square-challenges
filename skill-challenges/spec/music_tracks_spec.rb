require 'music_tracks'

describe MusicTracks do
  context "the list is empty" do
    it "fails" do
      music = MusicTracks.new
      expect { music.list }.to raise_error "You have not listened to any music yet." 
    end
  end

  context "the track to add field is empty" do
    it "fails" do
      music = MusicTracks.new
      expect { music.add("") }.to raise_error "You have not added any music."  
    end
  end

  context "added some music" do
    it "return the name of the only track and adds it to the list" do
      music = MusicTracks.new
      expect(music.add("Take me to church")).to eq "'Take me to church' is added to your track list."
      expect(music.list).to eq "Take me to church" 
    end

    it "adds several music tracks to the list and returns the list" do
      music = MusicTracks.new
      music.add("Take me to church") 
      music.add('Mamma Mia!') 
      expect(music.list).to eq "Take me to church, Mamma Mia!"        
    end
  end
end


  