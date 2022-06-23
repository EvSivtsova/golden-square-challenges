require "relevant_stuff" 

describe RelevantStuff do
  context "initially" do
    it "returns empty diary, tasks, phone book arrays" do
      today = RelevantStuff.new
      expect(today.show_diary).to eq []
      expect(today.show_tasks).to eq []
      expect(today.show_phone_book).to eq []
    end
  end
end