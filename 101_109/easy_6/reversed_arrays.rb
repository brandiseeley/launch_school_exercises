# Write a method that takes an Array as an argument, and reverses its 
# elements in place; that is, mutate the Array passed into this method. 
# The return value should be the same Array object.

# You may not use Array#reverse or Array#reverse!.

def reverse!(list)
  list_size = list.size
  counter = list_size - 1
  list_size.times do |_|
    list << (list[counter])
    counter -=1
  end
  list.slice!(0, list_size)
  list
end

list = [1,2,3,4]
result = reverse!(list)
p result == [4, 3, 2, 1] # true
p list == [4, 3, 2, 1] # true
p list.object_id == result.object_id # true

list = %w(a b e d c)
p reverse!(list) == ["c", "d", "e", "b", "a"] # true
p list == ["c", "d", "e", "b", "a"] # true

list = ['abc']
p reverse!(list) == ["abc"] # true
p list == ["abc"] # true

list = []
p reverse!(list) == [] # true
p list == [] # true

def reverse_better!(list)
  left_index = 0
  right_index = -1

  while left_index < list.size / 2
    list[left_index], list[right_index] = list[right_index], list[left_index]
    left_index += 1
    right_index -= 1
  end
  list
end

list = [1,2,3,4]
result = reverse_better!(list)
p result == [4, 3, 2, 1] # true
p list == [4, 3, 2, 1] # true
p list.object_id == result.object_id # true

list = %w(a b e d c)
p reverse_better!(list) == ["c", "d", "e", "b", "a"] # true
p list == ["c", "d", "e", "b", "a"] # true

list = ['abc']
p reverse_better!(list) == ["abc"] # true
p list == ["abc"] # true

list = []
p reverse_better!(list) == [] # true
p list == [] # true
