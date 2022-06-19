require 'todo_list'

describe ToDoList do
    context "no tasks on the todo list" do
      it "fails" do
        tasks = ToDoList.new
        expect { tasks.todo }.to raise_error "Congratulations! You are free as a bird today ))"        
      end
    end

    context "no task to add" do
      it "fails" do
        tasks = ToDoList.new
        expect { tasks.add("") }.to raise_error "What do you want to accomplish today?"
      end
    end
     
    context "one task added" do
      it "returns the task and adds it to the todo list" do
        tasks = ToDoList.new
        expect(tasks.add("walk the dog")).to eq "walk the dog"
        expect(tasks.todo).to eq "walk the dog"
      end
    end
    
    context "two tasks added" do
      it "returns a list of tasks" do
        tasks = ToDoList.new
        tasks.add("walk the dog")
        tasks.add("feed the cat") 
        expect(tasks.todo).to eq "walk the dog, feed the cat"
      end
    end

    context "no tasks completed" do
      it "fails" do
        tasks = ToDoList.new
        tasks.add("walk the dog")
        tasks.add("feed the cat") 
        expect { tasks.done("") }.to raise_error "Have you done anything today?"
      end
    end

    context "the task completed is not on the todo list" do
      it "fails" do
        tasks = ToDoList.new
        expect {tasks.done("walk the dog") }.to raise_error "Please add the task to your todo list first." 
      end 
    end

    context "a task is completed" do
      it "returns the task and removes it from the todo list" do
        tasks = ToDoList.new
        tasks.add("walk the dog")
        tasks.add("feed the cat") 
        expect(tasks.done("walk the dog")).to eq "walk the dog - done!"
        expect(tasks.todo).to eq "feed the cat"
      end
    end
end


