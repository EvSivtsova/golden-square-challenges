require 'check_grammar.rb'

describe "check_grammar method" do
  context "the text is given" do
    it "returns true" do
      result = check_grammar("This is a correct sentence.")
      expect(result).to eq true
    end

    it "returns true when the sentence ends with '?' " do
      result = check_grammar("Is this a correct sentence?")
      expect(result).to eq true
    end

    it "returns true when the sentence ends with '!' and first word is capitalized " do
      result = check_grammar("THIS sentence is also correct!")
      expect(result).to eq true
    end

    it "return false when the sentence ends with a comma" do
      result = check_grammar("Is this sentence correct too,")
      expect(result).to eq false
    end

    it "returns false when the first letter is not a capital letter" do
      result = check_grammar("the first letter is not a capital letter.")
      expect(result).to eq false
    end

    it "returns false when there is no dot at the end of the sentence" do
      result = check_grammar("There is no dot at the end of the sentence")
      expect(result).to eq false
    end
  end  

  context "no sentence provided" do
    it "fails" do
      expect { check_grammar("") }.to raise_error "No sentence provided."
    end
  end  
end