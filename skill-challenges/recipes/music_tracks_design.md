{{MUSIC TRACKS}} Class Design Recipe

1. Describe the Problem

As a user
So that I can keep track of my music listening
I want to add tracks I've listened to and see a list of them.

2. Design the Class Interface

class MusicTracks
  def initialize
    # @tracks = [] - an array of strings
  end

  def add(track) # track is a string
    # Returns the track added
    # Fails if the track field is empty
  end

  def list()
    # Fails if the list is empty
    # Returns the list of tracks listened
  end
end
3. Create Examples as Tests

Make a list of examples of how the class will behave in different situations.

# EXAMPLE

# 1
music = MusicTracks.new
music.list # => fails with "You have not listened to any music yet."

# 2
music = MusicTracks.new
music.add("") # => fails with "You have not added any music."

# 3
music = MusicTracks.new
music.add("Take me to church") # => " 'Take me to church' is added to your track list."
music.list # => "Take me to church"

# 4
music = MusicTracks.new
music.add("Take me to church") 
music.add('Mamma Mia!')
music.list # => "Take me to church, Mamma Mia!"


4. Implement the Behaviour

After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour.