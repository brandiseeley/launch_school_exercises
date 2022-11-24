# Every positive rational number can be written as an Egyptian fraction. For example:

#     1   1   1   1
# 2 = - + - + - + -
#     1   2   3   6

# Write two methods: one that takes a Rational number as an argument, and returns an Array 
# of the denominators that are part of an Egyptian Fraction representation of the number, 
# and another that takes an Array of numbers in the same format, and calculates the 
# resulting Rational number. You will need to use the Rational class provided by Ruby.
    
require 'pry-byebug'

def egyptian(sum)
  working_sum = 0
  den_counter = 1
  denominators = []
  loop do
    if (Rational(1, den_counter) + working_sum) <= sum
      denominators << den_counter
      working_sum += Rational(1, den_counter)
      den_counter += 1
    else
      den_counter += 1
    end
    break if working_sum >= sum
  end
  denominators
end

p egyptian(Rational(2, 1))    # -> [1, 2, 3, 6]
p egyptian(Rational(137, 60)) # -> [1, 2, 3, 4, 5]
p egyptian(Rational(3, 1))    # -> [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 15, 230, 57960]

def unegyptian(denominators)
  sum = 0
  denominators.each do |den|
    sum += Rational(1, den)
  end
  sum
end
p 
p unegyptian(egyptian(Rational(1, 2))) == Rational(1, 2)
p unegyptian(egyptian(Rational(3, 4))) == Rational(3, 4)
p unegyptian(egyptian(Rational(39, 20))) == Rational(39, 20)
p unegyptian(egyptian(Rational(127, 130))) == Rational(127, 130)
p unegyptian(egyptian(Rational(5, 7))) == Rational(5, 7)
p unegyptian(egyptian(Rational(1, 1))) == Rational(1, 1)
p unegyptian(egyptian(Rational(2, 1))) == Rational(2, 1)
p unegyptian(egyptian(Rational(3, 1))) == Rational(3, 1)
