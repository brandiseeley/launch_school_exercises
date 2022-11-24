# Write a method that takes an Array, and returns a new Array with the 
# elements of the original list in reverse order. Do not modify the 
# original list.

# You may not use Array#reverse or Array#reverse!, nor may you use the 
# method you wrote in the previous exercise.

def reverse(list)
  new_arr = []
  list.size.times do |i|
    new_arr.prepend(list[i])
  end
  new_arr
end

p reverse([1,2,3,4]) == [4,3,2,1]          # => true
p reverse(%w(a b e d c)) == %w(c d e b a)  # => true
p reverse(['abc']) == ['abc']              # => true
p reverse([]) == []                        # => true

list = [1, 3, 2]                      # => [1, 3, 2]
new_list = reverse(list)              # => [2, 3, 1]
p list.object_id != new_list.object_id  # => true
p list == [1, 3, 2]                     # => true
p new_list == [2, 3, 1]                 # => true

# Further Exploration

def reverse_2(list)
  list.each_with_object([]) { |e, new_arr| new_arr.prepend(e) }
end

p reverse_2([1,2,3,4]) == [4,3,2,1]          # => true
p reverse_2(%w(a b e d c)) == %w(c d e b a)  # => true
p reverse_2(['abc']) == ['abc']              # => true
p reverse_2([]) == []                        # => true

list = [1, 3, 2]                      # => [1, 3, 2]
new_list = reverse_2(list)              # => [2, 3, 1]
p list.object_id != new_list.object_id  # => true
p list == [1, 3, 2]                     # => true
p new_list == [2, 3, 1]                 # => true
