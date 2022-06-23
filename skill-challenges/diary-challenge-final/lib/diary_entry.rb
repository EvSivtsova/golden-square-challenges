class DiaryEntry
    def initialize(title, contents)
      @title = title
      @contents = contents
    end
  
    def title
      return @title
    end
  
    def contents
      return @contents
    end

    def count_words
      @contents.split(" ").count
    end

    def reading_time(wpm) 
			fail "WPM must be positive" if wpm <= 0 
      return (count_words / wpm.to_f).ceil   
    end
  end