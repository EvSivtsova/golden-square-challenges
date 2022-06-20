require 'diary'
require 'diary_entry_2'

describe "integration" do
  it "lists all entries in the diary" do
    diary = Diary.new
    diary_entry_1 = DiaryEntry.new("my title 1", "my contents 1")
    diary_entry_2 = DiaryEntry.new("my title 2", "my contents 2")
    diary.add(diary_entry_1)
    diary.add(diary_entry_2)
    expect(diary.all).to eq [diary_entry_1, diary_entry_2]
  end
 
  describe "word counting behaviour" do
    it "counts the words in all diary entries' contents" do
      diary = Diary.new
      diary_entry_1 = DiaryEntry.new("my title 1", "my contents 1")
      diary_entry_2 = DiaryEntry.new("my title 2", "my contents 2")
      diary.add(diary_entry_1)
      diary.add(diary_entry_2)
      expect(diary.count_words).to eq 6
    end 
  end

  describe "reading time behaviour" do
    it 'fails if wpm is less or equal to 0' do
      diary = Diary.new
      diary_entry_1 = DiaryEntry.new("my title 1", "my contents 1")
      diary_entry_2 = DiaryEntry.new("my title 2", "my contents 2")
      diary.add(diary_entry_1)
      diary.add(diary_entry_2)
      expect { diary.reading_time(0) }.to raise_error "WPM must be positive"
    end 

    it "calculates the reading time for all diary entries' contents" do
      diary = Diary.new
      diary_entry_1 = DiaryEntry.new("my title 1", "my contents 1")
      diary_entry_2 = DiaryEntry.new("my title 2", "my contents 2")
      diary.add(diary_entry_1)
      diary.add(diary_entry_2)
      expect(diary.reading_time(3)).to eq 2
    end 
  end

  describe "best reading time entry behaviour" do
    it 'fails if wpm is less or equal to 0' do
      diary = Diary.new
      diary_entry = DiaryEntry.new("my entry", "I feel happy and upset at the same time")
      expect { diary.reading_time(0) }.to raise_error "WPM must be positive"
    end 

    context "where we just have one entry and can read it within the time available" do
      it "returns the entry" do
        diary = Diary.new
        diary_entry_1 = DiaryEntry.new("my title 1", "my contents 1")
        diary.add(diary_entry_1)
        result = diary.find_best_entry_for_reading_time(5, 1)
        expect(result).to eq diary_entry_1
      end
    end

    context "where we just have one entry and it is unreadable in the time" do
      it "returns nil" do
        diary = Diary.new
        diary_entry_1 = DiaryEntry.new("my title 1", "my contents 1")
        diary.add(diary_entry_1)
        result = diary.find_best_entry_for_reading_time(2, 1)
        expect(result).to eq nil
      end
    end

    context "where we just have more than one entry" do
      it "returns the longest we can read within the time limit" do
        diary = Diary.new
        diary_entry_1 = DiaryEntry.new("my title 1", "my contents 1")
        diary_entry_2 = DiaryEntry.new("my title 2", "my contents 1 2")
        diary_entry_3 = DiaryEntry.new("my title 3", "my contents 1 2 3")
        diary_entry_4 = DiaryEntry.new("my title 4", "my contents 1 2 3 4")
        diary.add(diary_entry_1)
        diary.add(diary_entry_2)
        diary.add(diary_entry_3)
        diary.add(diary_entry_4)
        result = diary.find_best_entry_for_reading_time(5, 1)
        expect(result).to eq diary_entry_3 
      end
    end
  end

end
