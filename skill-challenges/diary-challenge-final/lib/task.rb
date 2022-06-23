class Task
    def initialize(title, task)
      @title = title
      @task = task
      @done = false
    end
 
    def title
      return @title
    end
 
    def task
      return @task
    end

    def mark_complete!
      @done = true
    end

    def done?
      return @done
    end
 end