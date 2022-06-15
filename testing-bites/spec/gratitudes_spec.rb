require 'gratitudes.rb'

describe Gratitudes do
  it "test for two gratitudes ('sunshine' and 'water') output" do
    gratitudes = Gratitudes.new
    gratitudes.add("sunshine")
    gratitudes.add("water")
    result = gratitudes.format
    expect(result).to eq "Be grateful for: sunshine, water"
  end

  it "test for one gratitude ('love') output" do
    gratitude = Gratitudes.new
    gratitude.add("love")
    result = gratitude.format
    expect(result).to eq "Be grateful for: love"
  end
end 

