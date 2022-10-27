### PROBLEM:

# Write a method that counts the number of occurrences
# of each element in a given array.
# The words in the array are case-sensitive: 'suv' != 'SUV'.
# Once counted, print each element alongside the number of occurrences.

# Explicit requirements:
#     - each element counted is case sensitive.
#     - the printed output should include the element => number of occurences
# Implicit requirements:
#     - The given array should be unchanged
#     - Items should be printed in the order of first occurence
#     - an empty array should print nothing

# vehicles = [
#   'car', 'car', 'truck', 'car', 'SUV', 'truck',
#   'motorcycle', 'motorcycle', 'car', 'truck'
# ]

# count_occurrences(vehicles)

# Expected output :
  # car => 4
  # truck => 3
  # SUV => 1
  # motorcycle => 2 

### DATA STRUCTURE
# input: array
# output: nil
# - need to store the items and number of times they appear in array
# - hash with keys as the unique elements of the array
# - values as the number of times each element appears

### ALGORITHM
# - Create an empty 'final_count' hash
# - iterate through the given array
# - if the item is not a key in the final_count hash
#   - add it to the hash with a value of 1
# - if the item is a key in the final_count hash
#   - increase the value of the item's value by 1 in the hash
# - iterate through the hash
# - print each key with its value to the output
#   - iterate through hash
#   - print key + ' => ' + value


def count_occurrences(array)
  final_count = {}
  array.each do |element|
    if final_count.include?(element.to_sym)
      final_count[element.to_sym] += 1
    else
      final_count[element.to_sym] = 1
    end
  end
  pretty_print(final_count)
end

def pretty_print(hash)
  hash.each do |element, count|
    puts "#{element} => #{count}"
  end
end

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

# test case sensitivity
letters = %w(a A A b c c C)
count_occurrences(letters)

unchanged_vehicles = vehicles

count_occurrences(vehicles)
count_occurrences([])
# test that original array has been unchanged
p vehicles == unchanged_vehicles
