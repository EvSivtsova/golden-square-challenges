{{TRACK TASKS}} Method Design Recipe

1. Describe the Problem

Put or write the user story here. Add any clarifying notes you might have.

> As a user
> So that I can keep track of my tasks
> I want to check if a text includes the string #TODO.


2. Design the Method Signature

Include the name of the method, its parameters, return value, and side effects.

```ruby

track_tasks(text)
text is a string containing letters, space and symbols
the return value is boolean:
 - true if the task containts #TODO
 - false if it doesn't

```

3. Create Examples as Tests

Make a list of examples of what the method will take and return.

```ruby
# 1
track_tasks("") 
# => fails "No text provided."

# 2
track_tasks("there is some text")
# => false

# 3
track_tasks("#TODO I have something to do")
# => true

#4
track_tasks("Do I have something #TODO?")
# => true

```

4. Implement the Behaviour

After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour.