require "task"

describe Task do
  it "constructs"do
    monday_task = Task.new("monday morning", "wash the dishes")
    expect(monday_task.title).to eq "monday morning"
    expect(monday_task.task).to eq "wash the dishes"
  end

  context "when marking the task complete" do
    it "marks the task complete" do
      monday_task = Task.new("monday morning", "wash the dishes")
      monday_task.mark_complete!
      expect(monday_task.done?).to eq true
    end
  end
end
