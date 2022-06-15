{GRAMMAR} Method Design Recipe

1. Describe the Problem

> As a user
> So that I can improve my grammar
> I want to verify that a text starts with a capital letter and ends with a suitable sentence-ending punctuation mark.

2. Design the Method Signature

Include the name of the method, its parameters, return value, and side effects.

```ruby
check_grammar(text)

# * Text is string with words and symbols.
# * Return value is boolean: 
- true if the first letter is a capital letter and if there is a dot at the end of the sentence
- false if the above two conditions are not met
```

3. Create Examples as Tests

Make a list of examples of what the method will take and return.

```ruby
# 1
check_grammar("")
# => fail "Not a sentence"

# 2
check_grammar("the first letter is not a capital letter.")
# => false

# 3
check_grammar("There is no dot at the end of the sentence")
# => false

# 4
check_grammar("This is a correct sentence.")
# => true

# 5
check_grammar("Is this a correct sentence?")
# => true

# 6 
check_grammar("THIS sentence is also correct!")
# => true

# 7
check_grammar("Is this sentence correct too,")
# => false

```

Encode each example as a test. You can add to the above list as you go.

4. Implement the Behaviour

After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour.