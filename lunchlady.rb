require_relative "maindish"

@meatloaf = Lunch.new('Meatloaf', 2.5)
@cheeseburger = Lunch.new('Cheeseburger', 8.0)
@burrito_bowl = Lunch.new('Burrito Bowl', 7.50)
@pepperoni_pizza = Lunch.new('Pepperoni Pizza', 12.50)
@side_salad = Lunch.new('Side Salad', 2.0)
@french_fries = Lunch.new('french fries', 1.50)
@mashed_potatoes = Lunch.new('Mashed Potatoes', 6.0)
@guac = Lunch.new('Guac', 10.00)


#@ is an instance variable
@main = [
@meatloaf,
@cheeseburger,
@burrito_bowl,
@pepperoni_pizza,
]

@side_choices = [
@side_salad,
@french_fries,
@mashed_potatoes,
@guac,
]

@sides = []

@order = []


def menu
  puts "---------------------------------------"
  puts "What would you like to eat today!?"
  puts "1. Choose main dish"
  puts "2. Select two side dishes"
  puts "3. Please review order"
  puts "4. Check out"
  selection = gets.strip.to_i
end

def main_menu
  puts "Please select from the following choices:"
  @main.each_with_index do |main, value|
    list_index = value + 1
    print "#{list_index}) "
    main.info
  end
  selection =  gets.strip.to_i
  @order << @main[selection -1] # -1 makes it so the user doesnt see 0, 1, etc. it starts at 1
  puts "You selected #{@main[selection -1].name}"
end


# SIDE DISH SECTION--------------------------------------
def side_dishes
  puts "Please chooose a side dish"
  @side_choices.each_with_index do |side, value|
    list_index = value +1
    print "#{list_index}) "
    side.info
  end
  selection = gets.strip.to_i
  @sides << @side_choices[selection - 1]
  puts "You selected: #{@side_choices[selection - 1].name}"
  side_dish2
end

def side_dish2
  puts "You get to choose 2 sides, please pick another side"
  @side_choices.each_with_index do |side, value|
    list_index = value +1
    print "#{list_index}) "
    side.info
  end
  selection = gets.strip.to_i
  @sides << @side_choices[selection - 1]
  puts "You selected: #{@side_choices[selection - 1].name}"
end


# part that tells us what has been selected--------------------------
def items_chosen
  puts "Here is what you have chosen so far:"
  @main.each do |selections|
    selections.info
    puts "#{selections}"
  end
  # @menu << @side_choices[select -1] WHAT CAN I DO HERE INSTEAD?
  puts "#{@side_choices[select - 1].name}"
end
 #IDK WHY THIS^ ISNT WORKING



# ITEM CHOICE TOTALS-------------------------------------
def lunch_total
  total = 0
  @order.each do |item, value|
    item.price
    total += item.price
  end
  puts "Your total is: #{total}"
end
#WHY IS IT ONLY SHOWING THE MAIN DISH TOTAL AND NOT ADDING UP ALL SELECTIONS??

loop do
  case menu
  when 1
    puts "-------------------------------------"
    main_menu
  when 2
    puts "-------------------------------------"
    side_dishes
  when 3
    puts"--------------------------------------"
    items_chosen
  when 4
    puts "-------------------------------------"
    lunch_total
  else
    puts "try again"
  end
end
