# Write a method that returns an Array that contains every other
# element of an Array that is passed in as an argument. The 
# values in the returned list should be those values that are 
# in the 1st, 3rd, 5th, and so on elements of the argument Array.

# - create an empty odds array
# - iterate through array argument
# - push first element into odds
# - skip the second
# - repeat n times where n = the length of the input array

def oddities(array)
  odds = []
  array.each_with_index do |element, index|
    odds << element if ( index.even? || index == 0 )
  end
  odds
end

p oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
p oddities(['abc', 'def']) == ['abc']
p oddities([123]) == [123]
p oddities([]) == []
p oddities([1, 2, 3, 4, 1]) == [1, 3, 1]

# FURTHER EXPLORATION
# odds and evens
def split_array(array)
  odd_elements, even_elements = array.partition.each_with_index do |element, index|
  index.even?
  end
end

p split_array([1,2,3,4,5,6])

# solve in two different ways
def odds_and_evens(array)
  odds = []
  evens = []
  counter = 1
  for element in array
    if counter.odd?
      odds << element
    else
      evens << element
    end
    counter += 1
  end
  [odds, evens]
end

arrays = odds_and_evens([1,2,3,4,5,6,7])
p arrays[0]
p arrays[1]
arrays2 = odds_and_evens([26,85,2,4,62])
p arrays2[0]
p arrays2[1]
