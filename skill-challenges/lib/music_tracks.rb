class MusicTracks
    def initialize
      @tracks = []
    end
  
    def add(track)
      fail "You have not added any music." if track.empty?
      @tracks << track
      return "'#{track}' is added to your track list."
    end
  
    def list()
      fail "You have not listened to any music yet." if @tracks.empty?
      return @tracks.join(", ")
    end
  end