{{READING_TIME}} Method Design Recipe

1. Describe the Problem

Put or write the user story here. Add any clarifying notes you might have.

> As a user
> So that I can manage my time
> I want to see an estimate of reading time for a text, assuming that I can read 200 words a minute.

2. Design the Method Signature

Include the name of the method, its parameters, return value, and side effects.

'''ruby
reading_time = reading_time(str)

* text is a string, containing words
* speed = how many words I can read per minute = 200 
* reading_time format: min.sec 
'''

3. Create Examples as Tests

Make a list of examples of what the method will take and return.

'''ruby 

reading_time("I want to see an estimate of reading time for a text, assuming that I can read 200 words a minute") => 0

reading_time(less than 200 words - short phrase) => "6 sec"

reading_time(longer text "If" — BY RUDYARD KIPLING) => "1 min 26 sec"

'''

Encode each example as a test. You can add to the above list as you go.

4. Implement the Behaviour

After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour.