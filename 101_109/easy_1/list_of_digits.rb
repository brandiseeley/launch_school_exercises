# Write a method that takes one argument, a positive integer,
# and returns a list of the digits in the number.

# implicit requirement: array of numbers should appear in same order
# as they are in the number itself

def digit_list(number)
  number.digits.reverse
end

puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]             # => true
