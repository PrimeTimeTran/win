require_relative "item"
require_relative "list"
require 'colorize'

class Todo
  attr_accessor :list
  def initialize(file_name = "todo.data")
    puts "--------------------------------------------------------------".colorize(:green)
    puts "|               Welcome to the Ruby Todo List App!           |".colorize(:green)
    puts "--------------------------------------------------------------".colorize(:green)
    file = File.open(file_name)
    data = file.read
    items = []
    data.lines.each do |line|
      items << Item.new(line)
    end
    @list = List.new(items)
  end

  def display
    puts "Here are your TODO items for today:"
    @list.undone_items.each_with_index do |item, index|
      puts "#{index+1}. #{item.status} #{item.title}."
    end
  end
end

todo = Todo.new("todo.data")

if ARGV[0] == "done"
  puts "Nice!"
else ARGV[0] == "list"
  todo.list.all
end
