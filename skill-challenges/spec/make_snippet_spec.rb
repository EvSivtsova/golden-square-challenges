require 'make_snippet.rb'

describe "make_snipper_method" do
    it "returns an empty string" do
      result = make_snippet("")
      expect(result).to eq ""
    end

    it "returns a one word string" do
      result = make_snippet("universe")
      expect(result).to eq "universe"
    end
    
    it "returns a five word string" do
      result = make_snippet("I love food and coffee.")
      expect(result).to eq "I love food and coffee."
    end

    it "returns five first words from a longer string followed by '...'" do
      result = make_snippet("This is a very long string and it could be longer.")
      expect(result).to eq "This is a very long string..."
    end
end