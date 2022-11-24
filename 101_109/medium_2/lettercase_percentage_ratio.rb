# In the easy exercises, we worked on a problem where we had to count 
# the number of uppercase and lowercase characters, as well as characters 
# that were neither of those two. Now we want to go one step further.

# Write a method that takes a string, and then returns a hash that 
# contains 3 entries: one represents the percentage of characters in 
# the string that are lowercase letters, one the percentage of 
# characters that are uppercase letters, and one the percentage of 
# characters that are neither.

# You may assume that the string will always contain at least one 
# character.

def count_char_types(string)
  char_types = { lowercase: 0, uppercase: 0, neither: 0}
  string.chars.each do |char|
    if char.match(/[a-z]/)
      char_types[:lowercase] += 1
    elsif char.match(/[A-Z]/)
      char_types[:uppercase] += 1
    else
      char_types[:neither] += 1
    end
  end
  char_types
end

def letter_percentages(string)
  percentages = { lowercase: nil, uppercase: nil, neither: nil}
  char_types = count_char_types(string)
  total_chars = char_types.values.sum
  percentages.each do |key, value|
    percentages[key] = ((char_types[key] / total_chars.to_f) * 100).round(1)
  end
  percentages
end

p letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
p letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }
p letter_percentages('abcdefGHI') == { lowercase: 66.7, uppercase: 33.3, neither: 0.0 }
