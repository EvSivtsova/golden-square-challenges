require "secret_diary"
require "diary"

describe "integration" do
  context "diary is locked" do
    it "returns the error" do
      diary = Diary.new("my_diary")
      secret_diary = SecretDiary.new(diary)
      expect { secret_diary.read }.to raise_error "Go away!"
    end
  end

  context "diary is unlocked" do
    it "returns the diary's contents" do
      diary = Diary.new("my_diary")
      secret_diary = SecretDiary.new(diary)
      secret_diary.unlock
      expect(secret_diary.read).to eq diary 
    end
  end
  
end