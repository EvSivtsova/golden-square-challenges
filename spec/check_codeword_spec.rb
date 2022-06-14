require 'check_codeword.rb'

RSpec.describe "check_codeword_method" do
    it "when the codeword is 'horse' returns 'Correct! Come in.'" do
        result = check_codeword("horse")
        expect(result).to eq "Correct! Come in."
    end

    it "when the first letter of the codeword is 'h' and the last letter is 'e' returns 'Close, but nope.'" do
        result = check_codeword("hope")
        expect(result).to eq "Close, but nope."
    end  

    it "when the codeword is 'light' returns 'WRONG!'" do
       result = check_codeword("light")
       expect(result).to eq 'WRONG!'
    end
end    