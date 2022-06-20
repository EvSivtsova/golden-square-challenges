require "todo"

describe Todo do
  it "constructs" do
    todo = Todo.new("walk the dog")
    expect(todo.task).to eq "walk the dog"
  end

  it "marks the todo as done" do
    todo = Todo.new("walk the fish")
    todo.mark_done!
    expect(todo.done?).to eq true
  end

  it "returns false if the task is not done" do
    todo = Todo.new("walk the fish")
    expect(todo.done?).to eq false
  end
end