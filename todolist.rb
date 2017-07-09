module Menu
  def menu
    puts "Welcome! Please choose from the following options:
      1)  Add
      2)  Show
      3)  Write to a File 
      4)  Read from file
      5)  Delete a task from the list
      6)  Update a task from the list
      7)  Quit"
  end

  def show
    menu
  end
end

module Promptable
  def prompt(message = "What would you like to do?", symbol = ":> ")
    print message
    print symbol
    gets.chomp
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
    all_tasks.map.with_index { | l, i| "(#{i.next}): #{l}"}
  end

  def write_to_file(filename)
    IO.write(filename, @all_tasks.map(&:to_s).join("\n"))
  end

  def read_from_file(filename)
    IO.readlines(filename).each do |line|
      add(Task.new(line.chomp))
    end 
  end

  def delete(task_number)
    all_tasks.delete_at(task_number - 1)
  end

  def update(task_number, task)
    all_tasks[task_number - 1] = task
  end

end

class Task
  attr_reader :description
  def initialize(description)
    @description = description
  end

  def to_s
    description
  end

end


if __FILE__ == $PROGRAM_NAME
  include Menu
  include Promptable
  my_list = List.new
  puts "Please choose from the following list"
    until ['q'].include?(user_input = prompt(show).downcase)
      case user_input
      when "1" 
        my_list.add(Task.new(prompt('What is the task you 
          would like to accomplish?')))
      when "2"
        puts my_list.show
      when "3"
        my_list.write_to_file(prompt("What is the filename to write to?"))

      when "4"
        begin
          my_list.read_from_file(prompt("What is the filename to read from?"))
        rescue Errno::ENOENT
          puts "file name not found, verify filename and path"
        end

      when "5"
        puts my_list.show
        my_list.delete(prompt("What is the task you would like to delete?").to_i)
      
      when "6"
        my_list.update(prompt("What task would you like to update?").to_i,
        Task.new(prompt('Task Description')))

      else
        puts "Sorry, I did not understand or q to quit"
      end
      prompt('Press enter to continue','')

    end
    puts "Thanks for using the menu system!"
end

=begin
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
=end

