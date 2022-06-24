class MusicLibrary
    def initialize
      @music_library = []
    end
  
    def add(track) 
      @music_library << track
    end
  
    def all
      return @music_library
    end
    
    def search(keyword) 
      @music_by_keyword = []
      @music_library.map do |track|
        if track.matches?(keyword) 
          @music_by_keyword << track
        end
      end  
      @music_by_keyword
    end
  end