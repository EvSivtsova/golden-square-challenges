require "diary_entry_2"

describe DiaryEntry do
  it "constructs" do
    diary_entry = DiaryEntry.new("my title", "my contents")
    expect(diary_entry.title).to eq "my title"
    expect(diary_entry.contents).to eq "my contents"
  end

  describe "@count_words" do
    it "returns number of words in the contents" do
      diary_entry = DiaryEntry.new("my entry", "I feel happy and upset at the same time")
      expect(diary_entry.count_words).to eq 9
    end

    it "returns one if contents is one word" do
        diary_entry = DiaryEntry.new("my entry", "word")
        expect(diary_entry.count_words).to eq 1
    end

    it "returns zero if contents is empty" do
      diary_entry = DiaryEntry.new("my entry", "")
      expect(diary_entry.count_words).to eq 0
    end
  end
  
  describe "@reading_time" do    
    it "returns reading time" do
      diary_entry = DiaryEntry.new("my entry", "I feel happy and upset at the same time")
      expect(diary_entry.reading_time(3)).to eq 3
    end

    it 'fails if wpm is less or equal to 0' do
      diary_entry = DiaryEntry.new("my entry", "I feel happy and upset at the same time")
      expect { diary_entry.reading_time(0) }.to raise_error "WPM must be positive"
    end 

    it 'returns 0 if contents is empty' do
     	diary_entry = DiaryEntry.new("my entry", "")
      expect(diary_entry.reading_time(3)).to eq 0
    end 
  end

  describe "@reading_chunk" do
    it "returns a chunk of text in line with time available amd wpm provided" do
      diary_entry = DiaryEntry.new("my entry", "I feel happy and upset at the same time")
      expect(diary_entry.reading_chunk(3, 1)).to eq "I feel happy"
    end

    it "returns the following chunk of text if the method is called more than once" do
      diary_entry = DiaryEntry.new("my entry", "I feel happy and upset at the same time")
      diary_entry.reading_chunk(3, 1)
      expect(diary_entry.reading_chunk(3, 1)).to eq "and upset at"
    end

    it "returns the end of text fully" do
        diary_entry = DiaryEntry.new("my entry", "I feel happy and upset at the same time.")
        diary_entry.reading_chunk(6, 1)
        expect(diary_entry.reading_chunk(6, 1)).to eq "the same time."
      end

    it "returns the text from the beginning once the entry has been read in full" do
      diary_entry = DiaryEntry.new("my entry", "I feel happy and upset at the same time")
      diary_entry.reading_chunk(3, 2)
      diary_entry.reading_chunk(5, 1)
      expect(diary_entry.reading_chunk(3, 1)).to eq "I feel happy"
    end

    it "fails if wpm is less or equal to 0" do
      diary_entry = DiaryEntry.new("my entry", "I feel happy and upset at the same time")
      expect { diary_entry.reading_chunk(0, 2) }.to raise_error "WPM must be positive"
    end  
  end
end