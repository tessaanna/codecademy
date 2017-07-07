module Menu
  def menu
    puts "Welcome! Please choose from the following options:
      1)  Add
      2)  Show
      3)  Quit"
  end

  def show
    menu
  end
end

module Promptable
  def prompt(message - "What would you like to do?", symbol = ":> ")
    print message
    print symbol
    gets.chomp
  end
end

class Task
  attr_reader :description
  def initialize(description)
    @description = description
  end
end

class List
  attr_reader :all_tasks
  def initialize
    @all_tasks = []
  end

  def add(task)
    all_tasks << task
  end

  def show
    all_tasks
  end
end

if __FILE__ == $PROGRAM_NAME
  my_list = List.new
  puts 'You have created a new list'
  #my_list.add(Task.new('Make Breakfast'))
  #my_list.add(Task.new('Make dinner'))
  my_list.add('Make Breakfast')
  my_list.add('Make dinner')
  puts 'You have added a task to the Todo List'
  puts my_list.show
end

