require_relative "item"
require_relative "list"
require 'colorize'

class Todo
  attr_accessor :list
  def initialize(file_name = "todo.data")
    puts ("-" * 75).colorize(:green)
    puts "Welcome to the Ruby Todo List App!".colorize(:green)
    puts "If you'd like to see a list of available comments, type in \n" + "-h".colorize(:light_red) +  " or " + "help".colorize(:light_red) +  " to " + "view the help menu.\n\n".colorize(:light_red)
    file = File.open(file_name)
    data = file.read
    items = []
    data.lines.each do |line|
      items << Item.new(line)
    end
    @list = List.new(items)
  end

  def seperate(title)
    puts "\n"
    puts ("-" * 75).colorize(:green)        
    puts title.colorize(:green)
    puts ("-" * 75).colorize(:green)    
  end

  def display
    @list.all
  end

  def prompt
    puts ("-" * 75).colorize(:green)
    print "Please enter an option: ".colorize(:green)
  end

  def input(input)
    input = input.downcase
    case input 
    when "display", "-d"
      display
    when "help", "-h"
      help
    when "add", "-a"
      @list.add
    when "remove", "-r"
      @list.remove
    when "mark", "-m"
      @list.mark_complete
    when "unmark", "-um"
      @list.unmark_complete
    when "colors"
      show_colors      
    else
      puts "Sorry!".colorize(:light_red) +" I don't understand that command."
      puts "Please try again or enter" + " -h".colorize(:light_red) + " or" + " help".colorize(:light_red) + " for more help"
    end
  end

  def help 
    puts "-h ".colorize(:light_red) + "or" + " help:".colorize(:light_red) + " Displays a list of all commands available."
    puts "-d ".colorize(:light_red) + "or" + " display:".colorize(:light_red) +" Displays your todo list with all items."
    puts "-a ".colorize(:light_red) + "or" + " add:".colorize(:light_red) + " Allows you to add new items to your todo list."
    puts "-r ".colorize(:light_red) + "or" + " remove:".colorize(:light_red) + " Allows you to remove items from your todo list."
    puts "-m ".colorize(:light_red) + "or" + " mark:".colorize(:light_red) + " Allows you to check items on the list as complete."
    puts "-um ".colorize(:light_red) + "or" + " unmark:".colorize(:light_red) + " Allows you to uncheck items as complete on your todo list."
  end

  def show_colors
    puts "black".colorize(:black)
    puts "light_black".colorize(:light_black)
    
    puts "red".colorize(:red)
    puts "light_red".colorize(:light_red)

    puts "green".colorize(:green)
    puts "light_green".colorize(:light_green)

    puts "yellow".colorize(:yellow)    
    puts "light_yellow".colorize(:light_yellow)

    puts "blue".colorize(:blue)
    puts "light_blue".colorize(:light_blue)

    puts "magenta".colorize(:magenta)    
    puts "light_magenta".colorize(:light_magenta)

    puts "cyan".colorize(:cyan)    
    puts "light_cyan".colorize(:light_cyan)

    puts "white".colorize(:white)    
    puts "light_white".colorize(:light_white)    

    puts "default".colorize(:default)    
  end  


  def save
    open('todo.data', 'w') { |f|
    @list.items.each do |item|
      f.puts item.current_status + " " + item.title
    end
    }
  end
end

@todo = Todo.new("todo.data")
# @todo.list.all
# loop do
#   @todo.prompt
#   input = gets.chomp
#   @todo.save
#   if input == "exit" || input == "-e"  
#     puts "Ok, exiting... See you next time & " + "<3".colorize(:red) + " from " + "CoderSchool\n".colorize(:red)
#     break
#   end
#   @todo.input(input)
# end  

# if ARGV[0] == "done"
#   puts "Nice!"
# else ARGV[0] == "list"
#   @todo.list.all
# end
