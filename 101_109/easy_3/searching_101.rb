# Write a program that solicits 6 numbers from the user,
# then prints a message that describes whether or not 
# the 6th number appears amongst the first 5 numbers.

# - create an empty numbers array
# - get a number from the user
# - save number into numbers
# - repeat 4 more times
# - get one more number
# - check if the last number is in numbers
# - tell the user

def num_suffix(num)
  case num
  when 1 ; 'st' ; when 2 ;'nd' ; when 3 ; 'rd' ; else ; 'th'
  end
end

def number_prompt(num)
  num_with_suffix = num.to_s + num_suffix(num)
  puts "==> Enter the #{num_with_suffix} number:"
end

numbers = []
(1..5).each { |i|
  number_prompt(i)
  number = gets.chomp.to_i
  numbers << number
}

puts "==> Enter the last number:"
special_number = gets.chomp.to_i

appears_or_not = numbers.include?(special_number) ? 'appears' : 'does not appear'

puts "The number #{special_number} #{appears_or_not} in #{numbers}."



