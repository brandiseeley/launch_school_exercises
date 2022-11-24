# Write a method that computes the difference between the square of 
# the sum of the first n positive integers and the sum of the squares 
# of the first n positive integers.
require 'pry-byebug'
def sum_square_difference(num)
   left_side = (1.upto(num).reduce(:+))**2
   right_side = 1.upto(num).reduce { |sum, n| sum + n*n }
   left_side - right_side
end

p sum_square_difference(3) == 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150
