# Using the multiply method from the "Multiplying Two Numbers" problem, 
# write a method that computes the square of its argument
# (the square is the result of multiplying a number by itself).



def multiply(first, second)
  first * second
end

def square(number)
  multiply(number, number)
end

p square(5) == 25
p square(-8) == 64
