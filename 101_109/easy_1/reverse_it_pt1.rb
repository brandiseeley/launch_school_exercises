# Write a method that takes one argument, a string, and returns
# a new string with the words in reverse order.

# puts reverse_sentence('Hello World') == 'World Hello'
# puts reverse_sentence('Reverse these words') == 'words these Reverse'
# puts reverse_sentence('') == ''
# puts reverse_sentence('    ') == '' # Any number of spaces results in ''

# Explicit requirements:
#   - white space should be ignored
#   - case should remain unchanged
#   - should return a different string
# Implicit requirements:
#   - original string should remain unchanged
#   - Punctuation should remain with word

# ALGORITHM
# - create an array containing each word of the sentence as an element
# - reverse the order of the array
# - create a final string containing all elements of the reversed array in order
# - return the final string

def reverse_sentence(string)
  string.split.reverse.join(' ')
end

sentence = "Let's see if this sentence stays the same"
sentence_unchanged = sentence

puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words!') == 'words! these Reverse'
puts reverse_sentence('') == ''
puts reverse_sentence('    ') == '' # Any number of spaces results in ''

# test that original string has been unchanged
reverse_sentence(sentence)
puts sentence == sentence_unchanged


