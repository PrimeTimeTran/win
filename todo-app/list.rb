class List
  attr_accessor :items
  def initialize(items)
    @items = items
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
    @items.each_with_index { |e, idx| puts (idx+1).to_s + ". " + e.line }
  end
end
