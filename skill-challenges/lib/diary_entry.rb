class DiaryEntry
    def initialize(title, contents) 
      @title = title
      @contents = contents
      @furthest_word_read = 0
    end
  
    def title
      @title
    end
  
    def contents
      @contents
    end
    
    def count_words
      words.count
    end

    def reading_time(wpm) 
      fail "Please improve your reading skills." if wpm <= 0
      (count_words / wpm.to_f).ceil
    end
  
    def reading_chunk(wpm, minutes)
      fail "Please improve your reading skills." if wpm <= 0  
      no_words_user_can_read = wpm * minutes
      start_from = @furthest_word_read
      end_at = @furthest_word_read + no_words_user_can_read
      text_to_read = words[start_from...end_at].join(" ")
      if end_at < count_words
        @furthest_word_read = end_at
      else
        @furthest_word_read = 0 
      end
      return text_to_read
    end

    private

    def words
      @contents.split(" ")
    end
end   