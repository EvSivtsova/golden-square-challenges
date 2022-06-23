require "diary_entry"

describe DiaryEntry do
  it "contructs" do
    today = DiaryEntry.new("Monday", "did this and that")
    expect(today.title).to eq "Monday"
    expect(today.contents).to eq "did this and that"
  end
end    