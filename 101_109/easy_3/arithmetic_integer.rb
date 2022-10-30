# Write a program that prompts the user for two positive integers,
# and then prints the results of the following operations on
# those two numbers: addition, subtraction, product, quotient, 
# remainder, and power. Do not worry about validating the input.

puts "==> Enter the first number:"
first = gets.chomp.to_i
puts "==> Enter the second number:"
second = gets.chomp.to_i
operations = {
'+': first + second,
'-': first - second,
'*': first * second,
'/': first / second,
'%': first % second,
'**': first ** second
}

operations.each { |operator, answer| 
  puts "%d %s %d = %d" % [first, operator, second, answer]
}
