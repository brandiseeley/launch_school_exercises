# Write a method that returns the next to last word in the String passed 
# to it as an argument.
# Words are any sequence of non-blank characters.
# You may assume that the input String will always contain at least two 
# words.

def penultimate(string)
  string.split[-2]
end

p penultimate('last word') == 'last'
p penultimate('Launch School is great!') == 'is'

# Further Exploration

# Our solution ignored a couple of edge cases because we explicitly stated 
# that you didn't have to handle them: strings that contain just one word, 
# and strings that contain no words.

# Suppose we need a method that retrieves the middle word of a 
# phrase/sentence. What edge cases need to be considered? How would you 
# handle those edge cases without ignoring them? Write a method that 
# returns the middle word of a phrase or sentence. It should handle all 
# of the edge cases you thought of.

# - if there are an even number of words, return the two middle words
# - if there are two or less words, return an empty string

def middle_word(string)
  words = string.split
  if words.size <= 2
    return ''
  elsif words.size > 2 && words.size.odd?
    return words[words.size / 2]
  else
    return words[words.size / 2] + ' ' + words[words.size/2 + 1]
  end
end

p middle_word('String with an odd number of words') == 'odd'
p middle_word('A string with an even number of words') == 'even number'
p middle_word('A string') == ''
p middle_word('A') == ''
p middle_word('') == ''
