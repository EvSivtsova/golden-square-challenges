require "todo_list_2"

describe TodoList do
  context "initially" do 
    it "returns an empty todo list" do
      todo_list = TodoList.new
      expect(todo_list.incomplete).to eq []
    end
    
    it "returns an empty list of completed tasks" do
      todo_list = TodoList.new
      expect(todo_list.complete).to eq []
    end
  end  

  context "when adding no task" do 
    it "fails" do
      todo_list = TodoList.new
      expect { todo_list.add("") }.to raise_error "No task added."
    end
  end
end