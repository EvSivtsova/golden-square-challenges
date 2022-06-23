
require "diary_entry"
require "task"
require "contact"
require "relevant_stuff"

describe "integration between RelevantStuff and DiaryEntry" do
  context "when adding diary entries to Diary" do
    it "adds and returns all entries" do
      today = RelevantStuff.new 
      monday = DiaryEntry.new("Monday", "did this and that")
      today.add_diary_entry(monday)
      tuesday = DiaryEntry.new("tuesday", "did not do anything at all")
      today.add_diary_entry(tuesday)
      expect(today.show_diary).to eq [monday, tuesday]
    end
  end

  context "when requesting an entry to read" do
    it "provides an entry based on time availabe and wpm" do
      today = RelevantStuff.new
      monday = DiaryEntry.new("Monday", "did this and that")
      tuesday = DiaryEntry.new("tuesday", "met Alexandre")
      today.add_diary_entry(monday)
      today.add_diary_entry(tuesday)
      expect(today.find_best_entry_for_reading(2, 1)).to eq tuesday
    end

    it "fails when wpm is less than or equal to 0" do
      today = RelevantStuff.new
      monday = DiaryEntry.new("Monday", "did this and that")
      tuesday = DiaryEntry.new("tuesday", "met Alexandre")
      today.add_diary_entry(monday)
      today.add_diary_entry(tuesday)
      expect { today.find_best_entry_for_reading(0, 1) }.to raise_error "WPM must be positive"
    end
  end  
end

describe "integration between RelevantStuff and Task" do
  context "when adding tasks to the TaskManager" do
    it "adds and returns tasks added" do
      today = RelevantStuff.new 
      monday_task = Task.new("monday morning", "wash the dishes")   
      today.add_task(monday_task)
      tuesday_task = Task.new("Tuesday morning", "walk the dog")
      today.add_task(tuesday_task)
      expect(today.show_tasks).to eq [monday_task, tuesday_task]
    end

    it "removes completed tasks of the task list" do
      today = RelevantStuff.new 
      monday_task = Task.new("monday morning", "wash the dishes")   
      today.add_task(monday_task)
      tuesday_task = Task.new("Tuesday morning", "walk the dog")
      today.add_task(tuesday_task)
      expect(today.show_tasks).to eq [monday_task, tuesday_task]
      monday_task.mark_complete!
      expect(today.show_tasks).to eq [tuesday_task] 
    end
  end
end

describe "integration between RelevantStuff and Contact" do
  context "when adding contacts" do
    it "returns all the contacts" do
      today = RelevantStuff.new 
      alexandre_dumas = Contact.new
      alexandre_dumas.add("Alexandre Dumas", "02345678901")
      somebody_else = Contact.new
      somebody_else.add("important somebody", "09945678901")
      today.add_contact(alexandre_dumas)
      today.add_contact(somebody_else)
      expect(today.show_phone_book).to eq [alexandre_dumas, somebody_else]
    end
  end

  context "when deleting contacts" do
    it "removes them from the phone_book" do
      today = RelevantStuff.new 
      alexandre_dumas = Contact.new
      alexandre_dumas.add("Alexandre Dumas", "02345678901")
      somebody_else = Contact.new
      somebody_else.add("important somebody", "09945678901")
      today.add_contact(alexandre_dumas)
      today.add_contact(somebody_else)
      expect(today.show_phone_book).to eq [alexandre_dumas, somebody_else]
      today.delete_contact(somebody_else)
      expect(today.show_phone_book).to eq [alexandre_dumas]
    end
  end

  context "when searching phone book by name" do
    it "returns contacts with that name" do
      today = RelevantStuff.new 
      alexandre_dumas = Contact.new
      alexandre_dumas.add("Alexandre Dumas", "02345678901")
      somebody_else = Contact.new
      somebody_else.add("important somebody", "09945678901")
      today.add_contact(alexandre_dumas)
      today.add_contact(somebody_else)
      expect(today.search_by_name("somebody")).to eq [somebody_else]
    end
  end

  context "when scanning diary for numbers" do
    it "creates a list of numbers" do
      today = RelevantStuff.new 
      monday = DiaryEntry.new("Monday", "did this and that, called 01234566891")
      today.add_diary_entry(monday)
      tuesday = DiaryEntry.new("tuesday", "to call 01234576891, 0901dff231 but did not do anything at all")
      today.add_diary_entry(tuesday)
      expect(today.list_fetched_numbers).to eq ["01234566891", "01234576891"]
    end
  end

  context "when importing fetched numbers" do
    it "creates contacts from fetched numbers" do
      today = RelevantStuff.new 
      monday = DiaryEntry.new("Monday", "did this and that, called 01234566891")
      today.add_diary_entry(monday)
      tuesday = DiaryEntry.new("tuesday", "to call 01234576891, 0901dff231 but did not do anything at all")
      today.add_diary_entry(tuesday)
      expect(today.list_fetched_numbers).to eq ["01234566891", "01234576891"]
      today.add_fetched_numbers_as_contacts
      expect(today.show_phone_book).to eq ["01234566891", "01234576891"]
    end 
  end
end

describe "integration between relevant stuff and other classes" do
  context "when searching diary and tasks by keyword" do
    it "returns records containing that keyword" do
      today = RelevantStuff.new
      monday = DiaryEntry.new("Monday", "did this and that")
      today.add_diary_entry(monday)
      tuesday = DiaryEntry.new("tuesday", "met Alexandre")
      today.add_diary_entry(tuesday)
      monday_task = Task.new("monday morning", "Alexandre to wash the dishes")
      tuesday_task = Task.new("Tuesday morning", "walk the dog")
      today.add_task(monday_task)
      today.add_task(tuesday_task)
      expect(today.search_by_keyword("alex")).to eq [tuesday, monday_task]
    end
  end

  context "when searching diary and tasks by title" do
    it "returns records containing that title" do
      today = RelevantStuff.new
      monday = DiaryEntry.new("Monday", "did this and that")
      today.add_diary_entry(monday)
      tuesday = DiaryEntry.new("tuesday", "met Alexandre")
      today.add_diary_entry(tuesday)
      monday_task = Task.new("monday morning", "Alexandre to wash the dishes")
      tuesday_task = Task.new("Tuesday evening", "walk the dog")
      today.add_task(monday_task)
      today.add_task(tuesday_task)
      expect(today.search_by_title("monday")).to eq [monday, monday_task]
    end
  end
end


