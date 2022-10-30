# Write a method that takes one argument, a positive integer,
# and returns a string of alternating 1s and 0s, always starting with 1.
# The length of the string should match the given integer.

# puts stringy(6) == '101010'
# puts stringy(9) == '101010101'
# puts stringy(4) == '1010'
# puts stringy(7) == '1010101'

### ALGORITHM ###
# - create an empty 'final' string
# - n times, where n is the input integer
#   - if the 'final' string is empty
#     - append '1' to final string
#   - otherwise, if the length of final string is odd
#     - append '0'
#   - if the length of final string is even
#     - append '1'
# - return the final string

# Further Exploration
# Modify stringy so it takes an additional optional argument that 
# defaults to 1. If the method is called with this argument set to 0, 
# the method should return a String of alternating 0s and 1s, but 
# starting with 0 instead of 1.

def stringy(integer, starting_int=1)
  final_string = starting_int.to_s
  (integer - 1).times do
    if final_string[-1] == '0'
      final_string << '1'
    else
      final_string << '0'
    end
  end
  final_string
end

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'

puts stringy(8, 0) == '01010101'
puts stringy(3, 0) == '010'
puts stringy(2, 0) == '01'
