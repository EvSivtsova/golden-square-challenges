require 'string_builder'

describe StringBuilder do
    it "testing the size of the string" do
      string = StringBuilder.new
      string.add("hello")
      result = string.size
      expect(result).to eq 5
    end

    it "testing the output" do
      string = StringBuilder.new
      string.add("hello")
      result = string.output
      expect(result).to eq "hello"
    end

    it "testing the size of the string with symbols, numbers and spaces" do
      string = StringBuilder.new
      string.add("I have $10!!!")
      result = string.size
      expect(result).to eq 13
    end

    it "testing the output og the string with symbols, numbers and spaces" do
      string = StringBuilder.new
      string.add("I have $10!!!")
      result = string.output
      expect(result).to eq "I have $10!!!" 
    end
end