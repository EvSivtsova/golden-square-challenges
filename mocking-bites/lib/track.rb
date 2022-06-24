class Track
    def initialize(title, artist) 
      @title = title
      @artist = artist
    end
    
    def title
      @title
    end

    def artist
      @artist
    end

    def matches?(keyword) 
      if @artist.downcase.include?(keyword) || @title.downcase.include?(keyword)
        true
      else
       false
      end
    end
  end
