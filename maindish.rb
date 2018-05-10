class Lunch
  attr_accessor :name, :price
  def initialize(name, price)
    @name = name
    @price = price
  end

  def info
    puts "#{@name}, $#{@price}"
  end
end
