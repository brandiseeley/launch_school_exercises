# Write a method that searches for all multiples of 3 or 5 that 
# lie between 1 and some other number, and then computes the sum 
# of those multiples. For instance, if the supplied number is 20, 
# the result should be 98 (3 + 5 + 6 + 9 + 10 + 12 + 15 + 18 + 20).

# You may assume that the number passed in is an integer greater than 1.
# require 'pry'
require 'pry-byebug'

def multisum(num)
  counter = 0
  total = 0
  until counter > num
    binding.pry
    if counter % 3 == 0 || counter % 5 == 0
      total += counter
    end
    counter += 1
  end
  total
end

p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(1000) == 234168

### FURTHER EXPLORATION ###

def multisum2(num)
  counter = 0
  divisors = []
  until counter > num
    if counter % 3 == 0 || counter % 5 == 0
      divisors << counter
    end
    counter += 1
  end
  divisors.inject(:+)
end

p multisum2(3) == 3
p multisum2(5) == 8
p multisum2(10) == 33
p multisum2(1000) == 234168

