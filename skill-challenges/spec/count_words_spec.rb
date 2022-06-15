require 'count_words.rb'

describe "count_words method" do
  context "given an empty string" do
    it "returns '0'" do
      result = count_words("")
      expect(result).to eq 0
    end
  end

  context "given a string with words" do
    it "returns '1' when there is one word in the string" do
      result = count_words("word") 
      expect(result).to eq 1
    end  
  
    it "returns '8'" do
      result = count_words("The sun is shining high in the sky.")
      expect(result).to eq 8
    end
  end
end