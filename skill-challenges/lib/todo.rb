class Todo
    def initialize(task) 
      @todo = task
      @done = false
    end
  
    def task
      return @todo
    end
  
    def mark_done!
      @done = true
    end
  
    def done? 
      @done 
    end
  end