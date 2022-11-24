# Write a method that rotates an array by moving the first element to 
# the end of the array. The original array should not be modified.

# Do not use the method Array#rotate or Array#rotate! for your implementation.

def rotate_array(arr)
  arr[1, arr.size-1].append(arr[0])
end

p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1]   # => true
p x == [1, 2, 3, 4]                 # => true

# Further Exploration
# Write a method that rotates a string instead of an array. Do the same 
# thing for integers. You may use rotate_array from inside your new method.

def rotate_string(string)
  rotate_array(string.chars).join
end

p rotate_string('Hello World') == 'ello WorldH'
str = 'Check if it mutates'
p rotate_string(str) == 'heck if it mutatesC'
p str == 'Check if it mutates'

def rotate_int(integer)
  rotate_array(integer.to_s.chars).join.to_i
end

p rotate_int(1234) == 2341
p rotate_int(524) == 245

# Rotation Part 2

def rotate_rightmost_digits(integer, n)
  string = integer.to_s
  part_to_rotate = string[-n, string.size]
  ( string[0, string.size-n] + rotate_string(part_to_rotate) ).to_i
end

p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917

# Rotation part 3

# 12345| 12345 -> 23451 : rotate num[0..4]
# 2    | 3451 -> 4513   : rotate num[1..4]
# 24   | 513 -> 135     : rotate num[2..4]
# 241  | 35 -> 53       : rotate num[3..4]
# 24153 maximum rotation

def max_rotation(number)
  length = number.to_s.length
  (length - 1).times do |i|
    number = rotate_rightmost_digits(number, length - i)
  end
  number
end

p max_rotation(12345) == 24153
p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845

# Further Exploration
# There is an edge case in our problem when the number passed in as the 
# argument has multiple consecutive zeros. Can you create a solution that 
# preserves zeros?

def rotate_rightmost_digits_string(string, n)
  part_to_rotate = string[-n, string.size]
  ( string[0, string.size-n] + rotate_string(part_to_rotate) )
end

p rotate_rightmost_digits_string('035291', 1) == '035291'
p rotate_rightmost_digits_string('035291', 2) == '035219'
p rotate_rightmost_digits_string('035291', 3) == '035912'

# takes integer and outputs string
def max_rotation_string(number)
  string = number.to_s
  length = string.length
  (length - 1).times do |i|
    string = rotate_rightmost_digits_string(string, length - i)
  end
  string
end

p max_rotation_string(12345) == '24153'
p max_rotation_string(735291) == '321579'
p max_rotation_string(3) == '3'
p max_rotation_string(35) == '53'
p max_rotation_string(105) == '015'
