def move(n, from_array, to_array)
  return if n == 0 || from_array.empty?
  to_array << from_array.shift
  move(n - 1, from_array, to_array)
end

# Example

todo = ['study', 'walk the dog', 'coffee with Tom']
done = ['apply sunscreen', 'go to the beach']

move(2, todo, done)

p todo # should be: ['coffee with Tom']
p done # should be: ['apply sunscreen', 'go to the beach', 'study', 'walk the dog']

# Further Exploration : handle trying to move more items than are present in todo

todo = ['eat', 'sleep', 'hobby']
done = ['apply sunscreen', 'go to the beach']

move(4, todo, done)

p todo # should be: []
p done # should be: ['apply sunscreen', 'go to the beach', 'eat', 'sleep', 'hobby']
