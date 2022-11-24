# Write a method that takes two sorted Arrays as arguments, 
# and returns a new Array that contains all elements from 
# both arguments in sorted order.

# You may not provide any solution that requires you to sort 
# the result array. You must build the result array one 
# element at a time in the proper order.

# Your solution should not mutate the input arrays.

def merge(arr1, arr2)
  sorted_arr = []
  total_elements = arr1.size + arr2.size
  total_elements.times do |i|
    if arr1.empty?
       return (sorted_arr << arr2).flatten
    elsif arr2.empty?
      return (sorted_arr << arr1).flatten
    else
      arr1[0] < arr2[0] ? sorted_arr << arr1.shift : sorted_arr << arr2.shift
    end
  end
sorted_arr.flatten
end

p merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
p merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
p merge([], [1, 4, 5]) == [1, 4, 5]
p merge([1, 4, 5], []) == [1, 4, 5]
