# The String#to_i method converts a string of numeric characters (including an
# optional plus or minus sign) to an Integer. String#to_i and the Integer 
# constructor (Integer()) behave similarly. In this exercise, you will create
# a method that does the same thing.

# Write a method that takes a String of digits, and returns the appropriate 
# number as an integer. You may not use any of the methods mentioned above.

# For now, do not worry about leading + or - signs, nor should you worry about
# invalid characters; assume all characters will be numeric.

# You may not use any of the standard conversion methods available in Ruby to 
# convert a string to a number, such as String#to_i, Integer(), etc. Your 
# method should do this the old-fashioned way and calculate the result by 
# analyzing the characters in the string.

# - figure out the value of each string number, and place in the number
# - ex: '123' is a 1 in the 100s, 2 in the 10s, and 3 in the 1s place
# - add together the numbers multiplied by their place

require 'pry-byebug'
NUM_LIB = { '1' => 1, '2' => 2, '3' => 3,
            '4' => 4, '5' => 5, '6' => 6,
            '7' => 7, '8' => 8, '9' => 9,
            '0' => 0 }

def string_to_integer(string_num)
  number = 0
  place = 1
  string_num.chars.reverse.each do |char|
    number += place * NUM_LIB[char]
    place *= 10
  end
  number
end

p string_to_integer('4321') == 4321
p string_to_integer('570') == 570

# Further Exploration:
# Write a hexadecimal_to_integer method that converts a string 
# representing a hexadecimal number to its integer value.

HEX_LIB = { '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
            '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9,
            'A' => 10, 'B' => 11, 'C' => 12, 'D' => 13,
            'E' => 14, 'F' => 15 }

def hexadecimal_to_integer(string)
  value = 0
  string.chars.reverse.each_with_index do |char, i|
    value += 16 ** i * HEX_LIB[char.upcase]
  end
  value
end

p hexadecimal_to_integer('25') == 37
p hexadecimal_to_integer('4D9f') == 19871

# Write a method that takes a String of digits, and returns the 
# appropriate number as an integer. The String may have a leading
# + or - sign; if the first character is a +, your method should
# return a positive number; if it is a -, your method should return
# a negative number. If no sign is given, you should return a 
# positive number.

# You may assume the string will always contain a valid number.

def string_to_signed_integer(string)
    case string[0]
    when '-'
      -string_to_integer(string[1..-1])
    when '+'
      string_to_integer(string[1..-1])
    else
      string_to_integer(string)
  end
end

p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100
p string_to_signed_integer('0') == 0
