# Bubble Sort is one of the simplest sorting algorithms available. It 
# isn't an efficient algorithm, but it's a great exercise for student 
# developers. In this exercise, you will write a method that does a 
# bubble sort of an Array.

# A bubble sort works by making multiple passes (iterations) through the 
# Array. On each pass, each pair of consecutive elements is compared. If 
# the first of the two elements is greater than the second, then the two 
# elements are swapped. This process is repeated until a complete pass 
# is made without performing any swaps; at that point, the Array is 
# completely sorted.

# Write a method that takes an Array as an argument, and sorts that Array 
# using the bubble sort algorithm as just described. Note that your sort 
# will be "in-place"; that is, you will mutate the Array passed as an 
# argument. You may assume that the Array contains at least 2 elements.

=begin
- while something_changed 
- something_changed = false
- iterate through the array
- first = 0
- second = 1
- compare arr[0] with arr[1]
- if arr[0] > arr[1]
    - arr[1], arr[0] = arr[0], arr[1]
    - something_changed = true
- first += 1
- second += 1
- break if second >= arr.size
=end

def bubble_sort!(arr)
  loop do
    something_changed = false
    first = 0
    second = 1
    loop do
      if arr[first] > arr[second]
        something_changed = true
        arr[first], arr[second] = arr[second], arr[first]
      end
      first += 1
      second += 1
      break if second >= arr.size
    end
    break if something_changed == false
  end
  arr
end

array = [5, 3]
bubble_sort!(array)
p array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)

# Further Exploration
# Note that we did not use the optimization suggested on the Wiki page 
# that skips looking at tail elements that we know are already sorted. 
# If your solution also skipped this optimization, try modifying your 
# solution so it uses that optimization.

def optimized_bubble_sort!(arr)
  iteration = 0
  loop do
    something_changed = false
    i = 0
    loop do
      if arr[i] > arr[i + 1]
        arr[i], arr[i + 1] = arr[i + 1], arr[i]
        something_changed = true
      end
      i += 1
      break if i >= arr.size - iteration - 1
    end
    break if something_changed == false
    iteration += 1
  end
  arr
end

array = [5, 3]
optimized_bubble_sort!(array)
p array == [3, 5]

array = [6, 2, 7, 1, 4]
optimized_bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
optimized_bubble_sort!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)

# I want to compare how much faster omptimized_bubble_sort! is

array = Array.new(10_000) { rand(1...100) }
copy1 = array.dup
copy2 = array.dup

reg_start = Time.now

bubble_sort!(array)

reg_end_opt_start = Time.now

optimized_bubble_sort!(copy1)

opt_end_ruby_start = Time.now

copy2.sort

ruby_end = Time.now

puts "Regular Bubble sort executed in #{reg_end_opt_start - reg_start} seconds."
puts "Optimized Bubble sort executed in #{opt_end_ruby_start - reg_end_opt_start} seconds."
puts "Array#sort executed in #{ruby_end - opt_end_ruby_start} seconds."
