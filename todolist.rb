class List
  attr_reader :all_tasks
  def initialize(all_tasks)
    @all_tasks = []
  end

  def add(task)
    all_tasks << task
  end

end

if __FILE__ == $PROGRAM_NAME
  my_list = List.new
  puts "You have created a new list"
end




class Task
  attr_reader :description
  def initialize(description)
    @description = description
  end
end
