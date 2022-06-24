class StringRepeater
  def initialize(terminal)
    @terminal = terminal
  end

  def run
    @terminal.puts "Hello. I will repeat a string many times."
    @terminal.puts "Please enter a string"
    string = @terminal.gets
    @terminal.puts "Please enter a number of repeats"
    number_of_repeats = @terminal.gets.to_i
    @terminal.puts "Here is your result:"
    @terminal.puts "#{string * number_of_repeats}"
  end
end