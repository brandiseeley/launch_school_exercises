# Write a program that asks the user to enter an integer greater
# than 0, then asks if the user wants to determine the sum or
# product of all numbers between 1 and the entered integer.

# - get integer from user
# - get operator from user
# - if the operator input is 's'
#   - calculate the sum of integers from 1 to input integer
# - if the operator input is 'p'
#   - calculate the product of integers from 1 to input integer
# - display the total to the user

puts ">> Please enter an integer greater than 0:"
integer = gets.chomp.to_i
puts ">> Enter 's' to compute the sum, 'p' to compute the product."
operator_input = gets.chomp

operator_sym, operator_string = operator_input == 's' ? [:+, 'sum'] : [:*, 'product']

total = (1..integer).inject(operator_sym)

puts "The #{operator_string} of the integers between 1 and #{integer} is #{total}."


