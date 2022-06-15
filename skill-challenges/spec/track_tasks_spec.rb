require 'track_tasks.rb'

describe "track_tasks method" do
  
  context "no text provided" do
    it "fails" do
      expect { track_tasks("") }.to raise_error "No text provided."
    end
  end

  context "text provided" do
    it "returns fail if there is no '#TODO' in the text" do
      result = track_tasks("there is some text")
      expect(result).to eq false
    end

    it "returns true if the text containts '#TODO' at the very beginning" do
      result = track_tasks("#TODO I have something to do")
      expect(result).to eq true
    end

    it "returns true if '#TODO' is in the middle of the text" do
      result = track_tasks("Do I have something #TODO?")
      expect(result).to eq true
    end
  end
end