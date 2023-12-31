class TaskManager
  attr_reader :owner
  attr_accessor :tasks

  def initialize(owner)
    @owner = owner
    @tasks = []
  end

  def add_task(name, priority=:normal)
    task = Task.new(name, priority)
    tasks.push(task)
  end

  def complete_task(task_name)
    completed_task = nil

    tasks.each do |task|
      completed_task = task if task.name == task_name
    end

    if completed_task
      tasks.delete(completed_task)
      puts "Task '#{completed_task.name}' complete! Removed from list."
    else
      puts "Task not found."
    end
  end

  def display_all_tasks
    display(tasks)
  end

  def display_high_priority_tasks
    
    high_priority_tasks = tasks.select do |task| # the fix
      task.priority == :high
    end

    display(high_priority_tasks)
  end

  private

  def display(tasks)
    puts "--------"
    tasks.each do |task|
      puts task
    end
    puts "--------"
  end
end

class Task
  attr_accessor :name, :priority

  def initialize(name, priority=:normal)
    @name = name
    @priority = priority
  end

  def to_s
    "[" + sprintf("%-6s", priority) + "] #{name}"
  end
end

valentinas_tasks = TaskManager.new('Valentina')

valentinas_tasks.add_task('pay bills', :high)
valentinas_tasks.add_task('read OOP book')
valentinas_tasks.add_task('practice Ruby')
valentinas_tasks.add_task('run 5k', :low)

valentinas_tasks.complete_task('read OOP book')

valentinas_tasks.display_all_tasks
valentinas_tasks.display_high_priority_tasks

=begin
The error arises on line 77 when we call `display_high_priorty_tasks`, which traces back 
to line 36. On line 36, we are assigning the local variable `tasks` to the return value of
calling the `select` method. As a result, the `select` method is called on the local variable 
`tasks` rather than the getter method because the getter method is shadowed (since Ruby 
prioritizes local variable over method call when it is ambiguous). And since the `tasks` is 
not yet initialized, it points to `nil`, causing the error that was raised.

To fix it, we have to eliminate the variable name ambiguity by either using a distinct name for 
the return value of the `select` method call or prepending `self.` to the `tasks` getter method.

=end