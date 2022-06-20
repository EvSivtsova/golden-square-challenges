class DiaryEntry
    def initialize(title, contents) # title, contents are strings
      @title = title
      @contents = contents
      @furthest_word_read = 0
    end
  
    def title
      return @title
    end
  
    def contents
      return @contents
    end
  
    def count_words
      words.count
    end
  
    def reading_time(wpm) 
      fail "WPM must be positive" if wpm <= 0
      return (count_words / wpm.to_f).ceil      
    end
  
    def reading_chunk(wpm, minutes)
      fail "WPM must be positive" if wpm <= 0
      words_to_read = wpm * minutes
      start_from = @furthest_word_read
      end_at = @furthest_word_read + words_to_read
      text_to_read = words[start_from...end_at].join(" ")
      if end_at >= count_words
        @furthest_word_read = 0
      else
        @furthest_word_read = end_at
      end
      return text_to_read
    end

    private

    def words
      @contents.split(" ")
    end
  end