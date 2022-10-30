# Build a program that asks a user for the length and width of a room
# in meters and then displays the area of the room in both square
# meters and square feet.

# Further Exploration
# Modify this program to ask for the input measurements in feet,
# and display the results in square feet, square inches, and square
# centimeters.

SQINCH_PER_SQFOOT = 144
SQCM_PER_SQINCH = 6.4516

def calc_room_size
  puts "Welcome! What is the length of the room in feet?"
  length = gets.chomp.to_i
  puts "Great. What is the width of the room in feet?"
  width = gets.chomp.to_i

  area_ft2 = length * width
  area_in2 = (area_ft2 * SQINCH_PER_SQFOOT).round(2)
  area_cm2 = (area_in2 * SQCM_PER_SQINCH).round(2)

  puts "The area of the room is #{area_ft2} square feet, #{area_in2} square inches, and #{area_cm2} square centimeters."

end

calc_room_size
