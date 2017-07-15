require 'colorize'

class Item
  attr_accessor :item
  def initialize(line)
    @line = line.chomp
  end

  def title
    @line[4..-1]
  end

  def done?
    @line[0..2] == "[x]"
  end

  def current_status
    @line[0..2]
  end

  def undone?
    !done?
  end

  def line
    done? ? @line.colorize(:light_cyan) : @line.colorize(:light_yellow)
  end

  def status
    done?
  end

  def done!
    @line = "[x] " + title
  end

  def undone!
    @line = "[ ] " + title
  end  
end
