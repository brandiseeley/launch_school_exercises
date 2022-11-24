# In the previous two exercises, you developed methods that convert
# simple numeric strings to signed Integers. In this exercise and 
# the next, you're going to reverse those methods.

# Write a method that takes a positive integer or zero, and converts
# it to a string representation.

NUM_LIB = {0 => '0', 1 => '1', 2 => '2', 3 => '3',
           4 => '4', 5 => '5', 6 => '6', 7 => '7',
           8 => '8', 9 => '9', }

def integer_to_string(number)
  num_string = ''
  number.digits.reverse.each { |d| num_string << NUM_LIB[d] }
  num_string
end

p integer_to_string(4321) == '4321'
p integer_to_string(0) == '0'
p integer_to_string(5000) == '5000'

# In the previous exercise, you developed a method that converts
# non-negative numbers to strings. In this exercise, you're going
# to extend that method by adding the ability to represent
# negative numbers as well.

# Write a method that takes an integer, and converts it to a string
# representation.

def signed_integer_to_string(number)
  case number <=> 0
  when -1 then '-' + integer_to_string(-number)
  when 1  then '+' + integer_to_string(number)
  else '0'
  end
end

p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'
