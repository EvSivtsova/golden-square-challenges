require "diary"

describe Diary do
  it "constructs" do
    diary = Diary.new("Something exciting")
    expect(diary.read).to eq "Something exciting"
  end
end