# {{Diary Entry}}

# 1. Describe the problem

# The program creates a diary entry and returns the time it will require to read it 
# as well as providing the user only with the amount of content that they can read within their time limit. 

# 2. Design the method signature

# title, contents are strings
# count_words: integer representing the number of words in the text
# wpm: an integer representing the number of words the user can read per minute
# reading_chunk: a string with a chunk of the contents that the user could read in the given number of minutes.
# it restarts if the text was read in full.

require 'diary_entry.rb'

describe DiaryEntry do
  it "constructs" do
    diary_entry = DiaryEntry.new("dog", "walk the dog")
    expect(diary_entry.title).to eq "dog"
    expect(diary_entry.contents).to eq "walk the dog"
  end    
end

describe "@count_words" do
  it "returns the number of words in the contents" do
    diary_entry = DiaryEntry.new("dog", "walk the dog " * 10)
    expect(diary_entry.count_words).to eq 30
  end
  
  it "returns 0 when the contents is empty" do
    diary_entry = DiaryEntry.new("dog", "")
    expect(diary_entry.count_words).to eq 0
  end
end

describe "@reading_time" do
  context "a wpm is above 0" do
    it "returns an integer representing reading time in minutes" do
      diary_entry = DiaryEntry.new("dog", "walk the dog " * 10)
      expect(diary_entry.reading_time(10)).to eq 3
    end

    it "returns an integer representing reading time in minutes" do
      diary_entry = DiaryEntry.new("dog", "walk the dog " * 15)
      expect(diary_entry.reading_time(10)).to eq 5
    end
  end

  context "a wpm equals to 0" do
    it "fails" do
      diary_entry = DiaryEntry.new("dog", "walk the dog " * 15)
      expect {diary_entry.reading_time(0)}.to raise_error "Please improve your reading skills."
    end
  end
end

describe "@reading_chunk" do
  context "a wpm equals to 0" do
    it "fails" do
      diary_entry = DiaryEntry.new("dog", "walk the dog " * 15)
      expect {diary_entry.reading_chunk(0, 5)}.to raise_error "Please improve your reading skills."
    end
  end

  context "the method called once" do
    it "returns the full contents" do
      diary_entry = DiaryEntry.new("dog", "walk the dog")
      result = diary_entry.reading_chunk(10, 1)
      expect(result).to eq "walk the dog"
    end

    it "returns some text in line with wpm and time available" do
      diary_entry = DiaryEntry.new("dog", "walk the dog " * 10)
      result = diary_entry.reading_chunk(10, 1)
      expect(result).to eq "walk the dog walk the dog walk the dog walk"
    end
  end
  
  context "the method is called more than once" do
    it "returns the continuation of the text when called twice" do
      diary_entry = DiaryEntry.new("dog", "walk the dog feed the cat swim with the fish")
      diary_entry.reading_chunk(3, 1)
      result = diary_entry.reading_chunk(3, 1)
      expect(result).to eq "feed the cat"
    end

    it "restarts after finishing on the last word" do
      diary_entry = DiaryEntry.new("dog", "walk the dog feed the cat")
      diary_entry.reading_chunk(3, 1)
      diary_entry.reading_chunk(3, 1)
      result = diary_entry.reading_chunk(3, 1)
      expect(result).to eq "walk the dog"
    end

    it "restarts after reading the whole contents" do
      diary_entry = DiaryEntry.new("dog", "walk the dog feed the cat")
      diary_entry.reading_chunk(3, 1)
      diary_entry.reading_chunk(4, 1)
      result = diary_entry.reading_chunk(3, 1)
      expect(result).to eq "walk the dog"
    end
  end
end