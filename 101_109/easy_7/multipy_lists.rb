# Write a method that takes two Array arguments in which each Array 
# contains a list of numbers, and returns a new Array that contains 
# the product of each pair of numbers from the arguments that have 
# the same index. You may assume that the arguments contain the same 
# number of elements.

def multiply_list(arr1, arr2)
  product_arr = []
  arr1.each_with_index do |element, i|
    product_arr << ( element * arr2[i] )
  end
  product_arr
end

p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]

# Further Exploration

def multiply_list2(arr1, arr2)
  arr1.zip(arr2).map { |arr| arr[0] * arr[1] }
end

p multiply_list2([3, 5, 7], [9, 10, 11]) == [27, 50, 77]

