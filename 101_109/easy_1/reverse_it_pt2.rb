### PROBLEM ###

# Write a method that takes one argument, a string containing
# one or more words, and returns the given string with words
# that contain five or more characters reversed. Each string 
# will consist of only letters and spaces. Spaces should be 
# included only when more than one word is present.

# INPUT: string
# OUTPUT: string
# Explicit requirements:
#   - the string contains one or more words
#   - each word containing 5 or more characters is reversed
#   - the string will only contain letters and spaces
#   - spaces should be included when more than one word is present
# Implicit requirements:
#   - extra whitespace will be ignored and replaced with a single ' '
#   - case will remain the same
#   - the words will retain their order in the sentence
#   - the original string will be unmodified

### EXAMPLES ###

# puts reverse_words('Professional')          # => lanoisseforP
# puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
# puts reverse_words('Launch School')         # => hcnuaL loohcS

### ALGORITHM ###
# - create a final_string string
# - split the input string into words seperated by spaces
# - create a 'words' array and populate it with the words we split
# - iterate through the 'words'
# - count the letters in each word
# - if the word has 5 or more letters
#   - reverse the order of the letters in that word,
#   - and add it to final_string
# - if the word has less than 5 letters
#   - add it to the final_string unchanged
# - return the final_string

def reverse_words(string)
  final_string = ''
  words_array = string.split
  words_array.each do |word|
    if word.length >= 5
      final_string << word.reverse + ' '
    else
      final_string << word + ' '
    end
  end
  final_string.strip
end

puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS

# test that the function does not mutate the string
string = "Does this function mutate the string"
unchanged_string = string
reverse_words(string)
puts string == unchanged_string
