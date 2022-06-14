require 'report_length.rb'

RSpec.describe "report_length method" do
    it "returns the message with length equal to '4' when given word 'home'" do
        result = report_length("home")
        expect(result).to eq "This string was 4 characters long."
    end

    it "returns the message with length equal to 3 when given string consisting of 3 blank spaces" do
        result = report_length("   ")
        expect(result).to eq "This string was 3 characters long."
    end

    it "returns the message with length equal to xxxx" do
        result = report_length("The sky is blue.")
        expect(result).to eq "This string was 16 characters long."
    end
end    