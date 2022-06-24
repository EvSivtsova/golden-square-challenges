require "secret_diary"

describe SecretDiary do
  context "diary is locked" do
    it "returns the error" do
      diary = double(:fake_diary, string: "Something is written here.")
      secret_diary = SecretDiary.new(diary)
      expect { secret_diary.read }.to raise_error "Go away!"
    end
  end

  context "diary is unlocked" do
    it "returns the diary's contents" do
      diary = double(:fake_diary, string: "Something is written here.")
      secret_diary = SecretDiary.new(diary)
      secret_diary.unlock
      expect(secret_diary.read).to eq diary
    end
  
    it "it gets locked and unlocked again" do
      diary = double(:fake_diary, string: "Something is written here.")
      secret_diary = SecretDiary.new(diary)
      secret_diary.unlock
      expect(secret_diary.read).to eq diary
      secret_diary.lock
      expect { secret_diary.read }.to raise_error "Go away!"
      secret_diary.unlock
      expect(secret_diary.read).to eq diary
    end
  end
end