# Write a method that takes an Array of numbers, and returns an Array
# with the same number of elements, and each element has the running
# total from the original Array.

def running_total(arr)
  total = 0
  arr.map { |num| total += num }
end

p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []

# Further Exploration:
# Try solving this problem using Enumerable#each_with_object
# or Enumerable#inject (note that Enumerable methods can be
# applied to Arrays).

def running_total2(arr)
  total = 0
  arr.each_with_object([]) do |num, final|
    final << total + num
    total += num
  end
end

p running_total2([2, 5, 13]) == [2, 7, 20]
p running_total2([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total2([3]) == [3]
p running_total2([]) == []
