#GRAMMARSTATS description

#The programm will let the user know whether user's sentences startis with a capital letter and ends with !, ? or ,.

#2. Design the Class Interface

#class GrammarStats
#    def initialize
      # ...
#    end

#   def check(text) # text is a string
      # Returns true or false depending on whether the text begins with a capital
      # letter and ends with a sentence-ending punctuation mark.
#    end

#    def percentage_good
      # Returns as an integer the percentage of texts checked so far that passed
      # the check defined in the `check` method. The number 55 represents 55%.
#    end
#  end

require 'grammar_stats.rb'

describe GrammarStats do
  context "@check? - text provided" do
    it "returns false if the sentence is incorrect" do
      check = GrammarStats.new
      result = check.check?("this is a sentence")
      expect(result).to eq false
    end

    it "returns false if the first letter is not capital" do
      check = GrammarStats.new
      result = check.check?("this is a sentence.")
      expect(result).to eq false
    end

    it "returns false if there is no punctuation at the end of the sentence" do
      check = GrammarStats.new
      result = check.check?("This is a sentence")
      expect(result).to eq false
    end

    it "returns true if the sentence is correct" do
      check = GrammarStats.new
      result = check.check?("This is a sentence.")
      expect(result).to eq true
    end
  end  

  context "@check? no text provided" do
    it "fails" do 
      check = GrammarStats.new
      expect { check.check?("") }.to raise_error "Please write a sentence."
    end
  end
end

describe "@percentage_good" do
  context "no text have been checked" do
    it "fails" do
      check = GrammarStats.new
      expect { check.percentage_good }.to raise_error "We haven't checked any texts yet."
    end
  end 
  
  context "some checks have been made" do
    it "returns '100' when the only sentence is correct" do
      check = GrammarStats.new
      check.check?("This is a correct sentences.")
      expect(check.percentage_good).to eq 100
    end 

    it "returns '100' when all of the sentences are correct" do
      check = GrammarStats.new
      check.check?("This is a correct sentences.")
      check.check?("This is a correct sentences.")
      check.check?("This is a correct sentences.")
      expect(check.percentage_good).to eq 100
    end 

    it "returns '0' when the only sentence is incorrect" do
      check = GrammarStats.new
      check.check?("this is an incorrect sentences.")
      expect(check.percentage_good).to eq 0
    end

    it "returns '50' when half of the sentences is correct" do
      check = GrammarStats.new
      check.check?("This is a correct sentences.")
      check.check?("this is an incorrect sentences.")
      expect(check.percentage_good).to eq 50
    end
  end  
end
 