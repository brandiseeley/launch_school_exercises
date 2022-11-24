# Sort an array of passed in values using merge sort. You 
# can assume that this array may contain only one type of 
# data. And that data may be either all numbers or all 
# strings.

# Merge sort is a recursive sorting algorithm that works by 
# breaking down the array elements into nested sub-arrays, 
# then recombining those nested sub-arrays in sorted order. 
# It is best shown by example. For instance, let's merge 
# sort the array [9,5,7,1]. Breaking this down into nested 
# sub-arrays, we get:

# [9, 5, 7, 1] ->
# [[9, 5], [7, 1]] ->
# [[[9], [5]], [[7], [1]]]

# We then work our way back to a flat array by merging each 
# pair of nested sub-arrays:

# [[[9], [5]], [[7], [1]]] ->
# [[5, 9], [1, 7]] ->
# [1, 5, 7, 9]

def merge(split_arrs)
  if split_arrs.none? { |element| element.class == Array }
    return split_arrs
  else
    return merge_two([merge(split_arrs[0]), merge(split_arrs[1])])
  end
end

def split_arr(arr)
  if arr.size == 1
    arr
  else
    half = arr.size / 2
    [split_arr(arr.slice(0...half)), split_arr(arr.slice(half..arr.size))]
  end
end

def merge_two(nested_arr)
  arr1 = nested_arr[0]
  arr2 = nested_arr[1]
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

def merge_sort(arr)
  split = split_arr(arr)
  merge(split)
end

p merge_sort([5, 3]) == [3, 5]
p merge_sort([6, 2, 7, 1, 4]) == [1, 2, 4, 6, 7]
p merge_sort(%w(Sue Pete Alice Tyler Rachel Kim Bonnie)) == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
p merge_sort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]) == [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]

