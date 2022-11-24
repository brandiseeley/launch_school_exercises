# Write a method that calculates and returns the index of the first 
# Fibonacci number that has the number of digits specified as an argument. 
# (The first Fibonacci number has index 1.)

def find_fibonacci_index_by_length(length)
  fib_index = 2
  fib1 = 1
  fib2 = 1
  next_fib = 2
  loop do
    return fib_index if next_fib.to_s.size >= length
    next_fib = fib1 + fib2
    fib1 = fib2
    fib2 = next_fib
    fib_index += 1
  end
end

p find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
p find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
p find_fibonacci_index_by_length(10) == 45
p find_fibonacci_index_by_length(100) == 476
p find_fibonacci_index_by_length(1000) == 4782
p find_fibonacci_index_by_length(10000) == 47847
