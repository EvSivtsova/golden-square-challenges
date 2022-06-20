require "todo"
require "todo_list_2"

describe "integration" do
  context "when adding a task" do
    it "adds the task to the list and returns it" do
      todo_list = TodoList.new
      todo1 = Todo.new("walk the dog")
      todo2 = Todo.new("wash the cat")
      todo3 = Todo.new("brush the fish")
      todo_list.add(todo1)
      todo_list.add(todo2)
      todo_list.add(todo3)
      expect(todo_list.incomplete).to eq [todo1, todo2, todo3]
    end
  end

  context "when completing tasks" do
    it "returns the list of completed tasks" do
      todo_list = TodoList.new
      todo1 = Todo.new("walk the dog")
      todo2 = Todo.new("wash the cat")
      todo3 = Todo.new("brush the fish")
      todo_list.add(todo1)
      todo_list.add(todo2)
      todo_list.add(todo3)
      todo1.mark_done!
      todo2.mark_done!
      todo3.mark_done!
      expect(todo_list.complete).to eq [todo1, todo2, todo3]
    end
  end
  
  context "when giving up" do
    it "marks all todos as complete" do
      todo_list = TodoList.new
      todo1 = Todo.new("walk the dog")
      todo2 = Todo.new("wash the cat")
      todo3 = Todo.new("brush the fish")
      todo_list.add(todo1)
      todo_list.add(todo2)
      todo_list.add(todo3)
      todo_list.give_up!
      expect(todo_list.complete).to eq [todo1, todo2, todo3]
    end
  end

end