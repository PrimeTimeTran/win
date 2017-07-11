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

  def undone?
    !done?
  end

  def line
    done? ? @line.colorize(:green) : @line.colorize(:yellow)
  end
end
