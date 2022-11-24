### PROBLEM ###
# Write a method that displays a 4-pointed diamond in an n x n grid, 
# where n is an odd integer that is supplied as an argument to the 
# method. You may assume that the argument will always be an odd integer.

# - print a diamond shape to the console
# - the diamond should fill and n x n grid where n is the method argument
# - assume the integer will always be odd
# - assume the integer will be greater than zero

### EXAMPLES ###
# diamond(5)
# NOTE: We'll use 0's to represent empty spaces for clarity, the solution
# should utilize a ' ' where we see 0 in the example
# 00*00
# 0***0
# *****
# 0***0
# 00*00

### DATA STRUCTURES ###
# input : integer
# intermediate : not applicable
# output : method prints to console, unutilized return value

### ALGORITHM ###
# - initialize a counter named row
# - n/2 times, print a row, row index starting at 1
#    - num_asterisks = row_index * 2 + 1
#    - num_spaces = (n - num_askerisks) / 2
#    - row = ' ' * num_spaces + num_asterisk + ' ' * num_spaces
#    - print row
# - print middle row, '*' * n
# - n/2 times, print a row, index counting down starting a n/2
#    - num_asterisks = row_index * 2 + 1
#    - num_spaces = (n - num_askerisks) / 2
#    - row = ' ' * num_spaces + num_asterisk + ' ' * num_spaces
#    - print row


def print_row(grid_size, distance_from_center)
  star_width = grid_size - 2 * distance_from_center
  if star_width > 2
    stars = '*' + ' ' * (star_width - 2) + '*'
  else
    stars = '*' * star_width
  end
    puts stars.center(grid_size)
end

def diamonds(n)
  middle = n/2
  (middle).downto(0) do |i|
    print_row(n, i)
  end
  (1).upto(middle) do |i|
    print_row(n,i)
  end
end

diamonds(5)
diamonds(11)
