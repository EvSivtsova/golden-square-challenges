{{RelevantStuff}} Multi-Class Planned Design Recipe

1. Describe the Problem

DONE - As a user
So that I can record my experiences
I want to keep a regular diary

DONE - As a user
So that I can reflect on my experiences
I want to read my past diary entries

As a user
So that I can reflect on my experiences in my busy day
I want to select diary entries to read based on how much time I have and my reading speed

DONE - As a user
So that I can keep track of my tasks
I want to keep a todo list along with my diary

As a user
So that I can keep track of my contacts
I want to see a list of all of the mobile phone numbers in all my diary entries


_________________________________________________________________
|  RelevantStuff                                                 |
|  - add_diary_entry(diary_entry)                                | 
|  - add_task(task)                                              |
|  - add_contact(contact)                                        | 
|  - delete_contact(contact)                                     | 
|  - returns diary, tasks and phone_book                         | 
|  - gets phone number from diary and adds them to phone_book    |   
|  - search_by_name(word) => [contacts]                          | 
|  - search_by_title(title_word) => [diary, tasks]               |   
|  - earch_by_keyword(word) => [diary, tasks]                    | 
|  - find_best_entry_for_reading(wpm, minutes)                   | 
|________________________________________________________________|
                /                 |   owns the below three lists   \ 
               ▼                  ▼                                 ▼
___________________      ____________________________       _____________________________
|  DiaryEntry      |     | Contact                  |       |  Task                      |
|  - title         |     | - name                   |       |  - title                   |
|  - content       |     | - phone_number           |       |  - task                    |
|  - count_words   |     | - checks phone_numbers   |       | - can be marked complete   |
|  - reading_time  |     |__________________________|       |____________________________|
|__________________|
 ▼

2. Design the Class System

class DiaryEntry
  def initialize(title, contents)
    # title and contents are strings
  end

  def title
    # returns title
  end

  def contents
    # returns contents
  end
  
  def count_words
    # returns the number of words in the contents - integer
  end
  
  def reading_time(wpm) 
		# fails if wpm <= 0 
    # return reading speed - integer
  end
end


class Task
   def initialize(title, task, done)
     # title and task are strings
     # done - boolean
   end

   def title
     # returns title
   end

   def task
     # returns task
   end

   def mark_complete!
      # marks the task as done - boolean: true - done, false - not completed yet
    end

   def done?
     # returns a boolean value: true - done, false - not completed yet
   end
end


class Contact
  def initialize
    # name -string
    # phone_number - string
  end

  def add(name, phone number)
    # name - is a string
    # number - is as tring - 11 digit, starts with 0
  end

  def name
    # returns the name
  end

  def phone_number
    # returns the phone_number
  end
end 


class RelevantStuff
  def initialize  # arrays of strings
    # Diary arrays
    # TaskManager array
    # PhoneBook array
  end

  def add_diary_entry(diary_entry)
    # adds the diary_entry from the DiaryEntry class
  end

  def add_task(task)
    # add instances of Task class to the array of tasks
  end

  def add_contact(contact)
    # adds instances of Contact class
  end

  def delete_contact(contact)
    # deletes contacts from the PhoneBook
  end

  def show_diary
     # returns all entries
  end
  
  def show_tasks
    # returns all undone tasks - instances of Task class
  end

  def show_phone_book
    # returns all contacts
  end
    
  def list_fetched_numbers
    # an array of strings
    # scans the diary for phone number and returns them in an array
  end 

  def add_fetched_numbers_as_contacts
    # doesn't return anything
    # adds fetched numbers to the phone_book
  end

  def search_by_name(word)
    # array of string
    # returns contacts with that name
  end

  def search_by_title(title_word)
    # array of string
    # returns records from Diary and TasksManager with similar titles
  end

  def search_by_keyword(word)
    # array of string
    # returns records from Diary and TasksManager with that keyword
  end

  def diary_entry_to_read(wpm, min)
    # returns the entry which the user can read based on their reading speed with given time limit.
    # string
  end
end

3. Create Examples as Integration Tests

Create examples of the classes being used together in different situations and combinations that reflect the ways in which the system will be used.

``` ruby

# METHOD RelevantStuff

# 1
#adds and returns all diary entries to diary array
today = RelevantStuff.new 
monday = DiaryEntry.new("Monday", "did this and that")
today.add_diary_entry(monday)
tuesday = DiaryEntry.new("tuesday", "did not do anything at all")
today.add_diary_entry(tuesday)
today.show_diary # => [monday, tuesday]

# 2
# when requesting an entry to read, provides an entry based on time availabe and wpm
today = RelevantStuff.new
monday = DiaryEntry.new("Monday", "did this and that")
tuesday = DiaryEntry.new("tuesday", "met Alexandre")
today.add_diary_entry(monday)
today.add_diary_entry(tuesday)
today.find_best_entry_for_reading(2, 1)) # => tuesday
 
# 3 
# when requesting an entry to read, fails when wpm is less than or equal to 0
today = RelevantStuff.new
monday = DiaryEntry.new("Monday", "did this and that")
tuesday = DiaryEntry.new("tuesday", "met Alexandre")
today.add_diary_entry(monday)
today.add_diary_entry(tuesday)
today.find_best_entry_for_reading(0, 1) # => fails with "WPM must be positive"

# 4 
# adds tasks to tasks and returns tasks added 
today = RelevantStuff.new 
monday_task = Task.new("monday morning", "wash the dishes")   
today.add_task(monday_task)
tuesday_task = Task.new("Tuesday morning", "walk the dog")
today.add_task(tuesday_task)
today.show_tasks # => [monday_task, tuesday_task]


# 5 
# removes completed tasks of the task list
today = RelevantStuff.new 
monday_task = Task.new("monday morning", "wash the dishes")   
today.add_task(monday_task)
tuesday_task = Task.new("Tuesday morning", "walk the dog")
today.add_task(tuesday_task)
today.show_tasks # => [monday_task, tuesday_task]
monday_task.mark_complete!
today.show_tasks # => [tuesday_task] 

# 6
# when adding contacts, returns all the contacts
today = RelevantStuff.new 
alexandre_dumas = Contact.new
alexandre_dumas.add("Alexandre Dumas", "02345678901")
somebody_else = Contact.new
somebody_else.add("important somebody", "09945678901")
today.add_contact(alexandre_dumas)
today.add_contact(somebody_else)
today.show_phone_book # => [alexandre_dumas, somebody_else]

# 7
# when deleting contacts, removes them from the phone_book
today = RelevantStuff.new 
alexandre_dumas = Contact.new
alexandre_dumas.add("Alexandre Dumas", "02345678901")
somebody_else = Contact.new
somebody_else.add("important somebody", "09945678901")
today.add_contact(alexandre_dumas)
today.add_contact(somebody_else)
today.show_phone_book # => [alexandre_dumas, somebody_else]
today.delete_contact(somebody_else)
today.show_phone_book # => [alexandre_dumas]

# 8

# when searching phone book by name, returns contacts with that name
today = RelevantStuff.new 
alexandre_dumas = Contact.new
alexandre_dumas.add("Alexandre Dumas", "02345678901")
somebody_else = Contact.new
somebody_else.add("important somebody", "09945678901")
today.add_contact(alexandre_dumas)
today.add_contact(somebody_else)
today.search_by_name("somebody") # => [somebody_else]


# 9

# when scanning diary for numbers, creates a list of numbers
today = RelevantStuff.new 
monday = DiaryEntry.new("Monday", "did this and that, called 01234566891")
today.add_diary_entry(monday)
tuesday = DiaryEntry.new("tuesday", "to call 01234576891, 0901dff231 but did not do anything at all")
today.add_diary_entry(tuesday)
today.list_fetched_numbers # => ["01234566891", "01234576891"]

# 10

# when importing fetched numbers, creates contacts from fetched numbers
today = RelevantStuff.new 
monday = DiaryEntry.new("Monday", "did this and that, called 01234566891")
today.add_diary_entry(monday)
tuesday = DiaryEntry.new("tuesday", "to call 01234576891, 0901dff231 but did not do anything at all")
today.add_diary_entry(tuesday)
expect(today.list_fetched_numbers) # => ["01234566891", "01234576891"]
today.add_fetched_numbers_as_contacts
expect(today.show_phone_book) # => ["01234566891", "01234576891"]


# 11

# when searching diary and tasks by keyword, returns records containing that keyword
today = RelevantStuff.new
monday = DiaryEntry.new("Monday", "did this and that")
today.add_diary_entry(monday)
tuesday = DiaryEntry.new("tuesday", "met Alexandre")
today.add_diary_entry(tuesday)
monday_task = Task.new("monday morning", "Alexandre to wash the dishes")
tuesday_task = Task.new("Tuesday morning", "walk the dog")
today.add_task(monday_task)
today.add_task(tuesday_task)
today.search_by_keyword("alex") # => [tuesday, monday_task]

# 12

# when searching diary and tasks by title, returns records containing that title
today = RelevantStuff.new
monday = DiaryEntry.new("Monday", "did this and that")
today.add_diary_entry(monday)
tuesday = DiaryEntry.new("tuesday", "met Alexandre")
today.add_diary_entry(tuesday)
monday_task = Task.new("monday morning", "Alexandre to wash the dishes")
tuesday_task = Task.new("Tuesday evening", "walk the dog")
today.add_task(monday_task)
today.add_task(tuesday_task)
today.search_by_title("monday") # => [monday, monday_task]


```

4. Create Examples as Unit Tests

Create examples, where appropriate, of the behaviour of each relevant class at a more granular level of detail.

```ruby

# class RelevantStuff

# 1 Constructs a database
# constructs: returns empty diary, tasks, phone book arrays
today = RelevantStuff.new
today.show_diary # => []
today.show_tasks # =>  []
today.show_phone_book # => []


# class DiaryEntry

# 1 
#constructs
today = DiaryEntry,new("Monday", "did this and that")
today.title # => "Monday
today.contents # => "did this and that"

# class Task 

# 1 
# constructs
monday_task = Task.new("monday morning", "wash the dishes")
monday_task.title # => "monday morning"
monday_task.task # => "wash the dishes"

# 2 
# marks the tasks done
monday_task = Task.new("monday morning", "wash the dishes")
monday_task.mark_complete!
monday_task.done? # => true

# class Contact 

# 1 
# adds names
contact = Contact.new 
contact.add("Alexandre Dumas", "02345678901")
contact.name # => "Alexandre Dumas" 
contact.phone_number # => "02345678901"

# 2 
# when adding names if the number is incorrect fails
contact = Contact.new 
contact.add("Alexandre Dumas", "345A7890") # => fails with "Phone number should be 11 digits and start with zero" 

```

Encode each example as a test. You can add to the above list as you go.

5. Implement the Behaviour

After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour.