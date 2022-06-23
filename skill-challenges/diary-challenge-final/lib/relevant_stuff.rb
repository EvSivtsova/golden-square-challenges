class RelevantStuff
    def initialize  
      @diary = []
      @tasks = []
      @phone_book = []
    end
    
    def add_diary_entry(diary_entry)
      @diary << diary_entry
    end

    def add_task(task)
      @tasks << task
    end

    def add_contact(contact)
      @phone_book << contact
    end

    def delete_contact(contact)
      @phone_book.delete(contact)
    end

    def show_diary
      return @diary 
    end
    
    def show_tasks
      return @tasks.reject(&:done?)
    end

    def show_phone_book
     return @phone_book  
    end

    def list_fetched_numbers
      @fetched_numbers = []
      @diary.map do |entry|
        @fetched_numbers << entry.contents.scan(/0[0-9]{10}/)
      end
      @fetched_numbers.flatten.uniq
    end 

    def add_fetched_numbers_as_contacts
      list_fetched_numbers.map do |number|
         @phone_book << number
      end
    end
  
    def search_by_name(word)
      suggested_contacts = []
      @phone_book.map do |contact|
        if contact.name.downcase.match?(word) == true
          suggested_contacts << contact
        end 
      end
      return suggested_contacts
    end
  
    def search_by_title(title_word)
      @title_word = title_word.downcase
      @suggested_title_records = []
      diary_title_search
      task_title_search
      return @suggested_title_records
    end

    def search_by_keyword(word)
      @word = word.downcase
      @suggested_records = []
      diary_content_search
      task_task_search
      return @suggested_records
    end
  
    def find_best_entry_for_reading(wpm, minutes)
      fail "WPM must be positive" if wpm <= 0 
		  readable_entries(wpm, minutes).sort_by(&:count_words).first
    end

    private

    def diary_content_search
      @diary.map do |diary_entry|
       if diary_entry.contents.downcase.match?(@word) == true
          @suggested_records << diary_entry
       end 
      end
    end

    def task_task_search
      @tasks.map do |task|
        if task.task.downcase.match?(@word) == true
          @suggested_records << task
        end 
      end
    end

    def diary_title_search
      @diary.map do |diary_entry|
       if diary_entry.title.downcase.match?(@title_word) == true
          @suggested_title_records << diary_entry
       end 
      end
    end

    def task_title_search
      @tasks.map do |task|
        if task.title.downcase.match?(@title_word) == true
          @suggested_title_records << task
        end 
      end
    end

    def readable_entries(wpm, minutes)
			@readable_entries =[]
      @readable_entries = @diary.select{ |entry| entry.reading_time(wpm) <= minutes }
		end	
  end
  