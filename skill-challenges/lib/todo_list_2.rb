class TodoList
    def initialize
      @todo_list = []
    end
  
    def add(todo) 
      fail "No task added." if todo.empty?
      @todo_list << todo
    end
  
    def incomplete
      return @todo_list
    end
  
    def complete
      return @todo_list.select(&:done?)
    end
  
    def give_up!
      return @todo_list.map(&:mark_done!)
    end
  end