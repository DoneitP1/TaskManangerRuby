# Task Manager Application

class Task
  attr_accessor :title, :completed

  def initialize(title)
    @title = title
    @completed = false
  end

  def mark_complete
    @completed = true
  end

  def to_s
    "#{completed ? '[x]' : '[ ]'} #{title}"
  end
end

class TaskManager
  def initialize
    @tasks = []
  end

  def add_task(title)
    @tasks << Task.new(title)
    puts "\nTask added: \"#{title}\""
  end

  def list_tasks
    puts "\nTasks:"
    @tasks.each_with_index do |task, index|
      puts "#{index + 1}. #{task}"
    end
  end

  def mark_task_complete(task_number)
    task = @tasks[task_number - 1]
    if task
      task.mark_complete
      puts "\nTask completed: #{task.title}"
    else
      puts "\nInvalid task number!"
    end
  end

  def delete_task(task_number)
    task = @tasks.delete_at(task_number - 1)
    if task
      puts "\nTask deleted: #{task.title}"
    else
      puts "\nInvalid task number!"
    end
  end

  def run
    loop do
      puts "\nTask Manager"
      puts "1. List tasks"
      puts "2. Add task"
      puts "3. Mark task as complete"
      puts "4. Delete task"
      puts "5. Exit"
      print "\nChoose an option: "
      choice = gets.chomp.to_i

      case choice
      when 1
        list_tasks
      when 2
        print "\nEnter task title: "
        title = gets.chomp
        add_task(title)
      when 3
        print "\nEnter task number to mark as complete: "
        task_number = gets.chomp.to_i
        mark_task_complete(task_number)
      when 4
        print "\nEnter task number to delete: "
        task_number = gets.chomp.to_i
        delete_task(task_number)
      when 5
        puts "\nGoodbye!"
        break
      else
        puts "\nInvalid choice. Please try again."
      end
    end
  end
end

# Run the task manager
TaskManager.new.run
# frozen_string_literal: true

