require 'colorize'

class List
  attr_accessor :items

  def initialize(items)
    @items = items
  end

  def seperate
    puts ("-" * 75).colorize(:green)        
  end

  def undone_items
    temp = []
    @items.each do |item|
      if item.undone?
        temp << item
      end
    end
    temp
  end

  def all
    puts "Todo List:".colorize(:green)
    puts ("-" * 75).colorize(:green)
    @items.each_with_index { |e, idx| puts (idx+1).to_s + ". " + e.line + "\n"}
  end

  def add
    print "What would you like to add? ".colorize(:green)
    item = gets.chomp
    puts "\nOkay, adding ".colorize(:green) + "#{item}" + " to the Todo list.\n".colorize(:green)
    new_item = Item.new("[ ] " + item)
    @items << new_item
    all
  end

  def remove
    print "Which item would you like to remove? ".colorize(:red)
    input = gets.chomp    
    puts "\nOk, removing item number ".colorize(:green) + "#{input}" + " from your list.\n".colorize(:green)
    @items.delete_at(input.to_i - 1)
    all
  end

  def mark_complete
    print "Which item would you like to mark complete? ".colorize(:green)
    input = gets.chomp
    puts "\nMarking item ".colorize(:green) + "#{input}" + " as complete.\n".colorize(:green)
    item = @items[input.to_i - 1]
    item.done!
    all
  end

  def unmark_complete
    print "Which item would you like to unmark as complete? ".colorize(:red)
    input = gets.chomp
    "\nMarking item ".colorize(:green) + "#{input}" + " as incomplete.\n".colorize(:green)
    item = @items[input.to_i - 1]
    item.undone!
    all
  end  
end
