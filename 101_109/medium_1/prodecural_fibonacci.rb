def fibonacci(nth)
  one_before = 1
  two_before = 0
  (nth-1).times do |i|
    one_before, two_before = [two_before + one_before, one_before]
  end
  one_before
end

# p fibonacci(1)
# p fibonacci(2)
# p fibonacci(5)
# p fibonacci(7)
# p fibonacci(20)
# p fibonacci(100)
# p fibonacci(100001) whoa.

# Fibonacci Last Digit

def fibonacci_last(nth)
  a = 0
  b = 1
  (nth).times do |_|
    a , b = [(a + b) % 10, a % 10]
  end
  a
end

# p fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
# p fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
# p fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
# p fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
# p fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
# p fibonacci_last(123456789) # -> 4

# Further Exploration
# After a while, even this method starts to take too long to compute 
# results. Can you provide a solution to this problem that will work 
# no matter how big the number? You should be able to return results 
# almost instantly. For example, the 123,456,789,987,745th Fibonacci 
# number ends in 5

REPEATING_FIB_SEQUENCE = [0, 1, 1, 2, 3, 5, 8, 3, 1, 4, 5, 9, 4, 3, 7, 
                          0, 7, 7, 4, 1, 5, 6, 1, 7, 8, 5, 3, 8, 1, 9, 
                          0, 9, 9, 8, 7, 5, 2, 7, 9, 6, 5, 1, 6, 7, 3, 
                          0, 3, 3, 6, 9, 5, 4, 9, 3, 2, 5, 7, 2, 9, 1]

def fib_last_so_fast(nth)
  REPEATING_FIB_SEQUENCE[nth % 60]
end

p fib_last_so_fast(15) == 0       # -> 0  (the 15th Fibonacci number is 610)
p fib_last_so_fast(20) == 5       # -> 5 (the 20th Fibonacci number is 6765)
p fib_last_so_fast(100) == 5      # -> 5 (the 100th Fibonacci number is 354224848179261915075)
p fib_last_so_fast(100_001) == 1  # -> 1 (this is a 20899 digit number)
p fib_last_so_fast(1_000_007) == 3# -> 3 (this is a 208989 digit number)
p fib_last_so_fast(123456789) == 4# -> 4
p fib_last_so_fast(123456789987745) == 5
