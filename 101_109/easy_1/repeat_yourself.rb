# PROBLEM:

# Write a method that takes two arguments, 
# a string and a positive integer, and prints 
# the string as many times as the integer indicates.

# rules:
#       Explicit requirements:
#         - the provided string should be printed
#         - as many times as indicated by the integer
#         - the integer must be positive (this means it will not be zero)
#       Implicit requirements:
#         - the string object should be unchanged
#         - an empty string should print nothing

# TEST CASES

#     repeat('Hello', 3) == nil  --> hello
#                                    hello
#                                    hello
#     repeat('', 4) == nil  -->

# NOT HANDLED:
#     repeat('Hello', 0)
#     repeat('Hello', -4)
#     repeat(['a', 'b', 'c'], 3)
#     repeat(3)

# DATA STRUCTURE / ALGORITHM
# input: string, integer
# output: nil
# side effects: prints to user

# - print given string
# - repeat until it's been printed the provided integer number of times

def repeat(string, num_times)
  num_times.times do
    puts string
  end
end

def repeat2(string, num_times)
  num_prints = 0
  loop do
    puts string
    num_prints += 1
    break if num_prints == num_times
  end
end

repeat('hello', 4)
repeat('three times', 3)
repeat('', 4)

repeat2('hello', 4)
repeat2('three times', 3)
repeat2('', 4)
