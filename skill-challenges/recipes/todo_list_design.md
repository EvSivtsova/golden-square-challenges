{{TO DO LIST}} Class Design Recipe

1. Describe the Problem

As a user, So that I can keep track of my tasks
I want a program that I can use to track my tasks:
- add todo tasks 
- see a list of them
- mark the completed tasks and have them disappear from my list

2. Design the Class Interface

class ToDoList
  def initialize
    # @tasks = [] # an array of strings
  end

  def add(task) 
    # task is a string
    # only one task is accepted
    # returns the task
    # fails if there's no task added
  end

  def todo
    # @tasks
    # returns the list of tasks - an array of strings
    # fails if there are no tasks in the list
  end  

  def done(task)
    # task is a string 
    # returns the task completed
    # removes the done task from the list 
    # fails if there's no task completed
    # fails if the task in not on the todo list
  end
end

3. Create Examples as Tests

Make a list of examples of how the class will behave in different situations.


# 1
tasks = ToDoList.new
tasks.add("") # => fails with "What do you want to accomplish today?"

# 2
tasks = ToDoList.new
tasks.add("walk the dog") => walk the dog"

# 3
tasks = ToDoList.news
tasks.todo # => fails with "Congratulations! You are free as a bird today ))"

# 4
tasks = ToDoList.new
tasks.add("feed the cat") 
tasks.todo # => "feed the cat"

# 5
tasks = ToDoList.new
tasks.add("walk the dog")
tasks.add("feed the cat") 
tasks.todo # => "walk the dog, feed the cat"

# 6
tasks = ToDoList.new
tasks.add("walk the dog")
tasks.add("feed the cat") 
tasks.done("") # => fails with "Have you done anything today?"

# 7
tasks = ToDoList.new
tasks.add("walk the dog")
tasks.add("feed the cat") 
tasks.done("walk the dog") # => "walk the dog - done!"
tasks.todo # => "feed the cat"

# 8
tasks = ToDoList.new
tasks.done("walk the dog") # => "Please add the task to your todo list first." 

4. Implement the Behaviour

After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour.