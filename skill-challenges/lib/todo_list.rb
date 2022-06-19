class ToDoList
    def initialize
      @tasks = []
    end
  
    def add(task) 
      fail "What do you want to accomplish today?" if task.empty?
      @tasks << task
      return task
    end
  
    def todo
      fail "Congratulations! You are free as a bird today ))" if @tasks.empty?
      return @tasks.join(", ")
    end  
  
    def done(task)
      fail "Have you done anything today?" if task.empty?
      fail "Please add the task to your todo list first." if !@tasks.include?(task)
      @tasks.delete(task)
      return "#{task} - done!"
    end
  end