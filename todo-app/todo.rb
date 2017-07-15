require_relative "item"
require_relative "list"
require 'colorize'

class Todo
  attr_accessor :list
  def initialize(file_name = "todo.data")
    puts ("-" * 75).colorize(:green)
    puts "Welcome to the Ruby Todo List App!".colorize(:green)
    puts "If you'd like to see a list of available comments, type in " + "-h".colorize(:light_red) +  " or " + "help".colorize(:light_red) +  " to view the help menu.\n\n".colorize(:green)
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
    print "What would you like to do? ".colorize(:green)
  end

  def input(input)
    input = input.downcase
    case input 
    when "display", "-d"
      display
    when "help", "-h"
      seperate("Available commands:")
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
      seperate("Sorry!")
      puts "I don't understand that command. Please try again or enter -h for more help"
    end
  end

  def help 
    puts "-h ".colorize(:light_cyan) + "or" + " help:".colorize(:light_cyan) + " Displays a list of all commands available."
    puts "-d ".colorize(:light_cyan) + "or" + " display:".colorize(:light_cyan) +" Displays your todo list with all items."
    puts "-a ".colorize(:light_cyan) + "or" + " add:".colorize(:light_cyan) + " Allows you to add new items to your todo list."
    puts "-r ".colorize(:light_cyan) + "or" + " remove:".colorize(:light_cyan) + " Allows you to remove items from your todo list."
    puts "-m ".colorize(:light_cyan) + "or" + " mark:".colorize(:light_cyan) + " Allows you to check items on the list as complete."
    puts "-um ".colorize(:light_cyan) + "or" + " unmark:".colorize(:light_cyan) + " Allows you to uncheck items as complete on your todo list."
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
@todo.list.all
loop do
  @todo.prompt
  input = STDIN.gets.chomp
  @todo.save
  if input == "exit" || input == "-e"  
    puts "\nOk, exiting... See you next time!".colorize(:light_red)
    break
  end
  @todo.input(input)
end  

# if ARGV[0] == "done"
#   puts "Nice!"
# else ARGV[0] == "list"
#   @todo.list.all
# end
