# given the array...
#  words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
#            'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
#            'flow', 'neon']

# Write a program that prints out groups of words that are anagrams. 
# Anagrams are words that have the same exact letters in them but in 
# a different order. Your output should look something like this:

# ["demo", "dome", "mode"]
# ["neon", "none"]
# #(etc)

def anagrams(words)
  anagrams = {}
  words.each do |word|
    sorted_word = word.chars.sort.join
    if anagrams.has_key?(sorted_word)
      anagrams[sorted_word] << word
    else
      anagrams[sorted_word] = [word]
    end
  end
  anagrams.each do |key, value|
    p value
  end
end

anagrams(['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
'flow', 'neon'])
