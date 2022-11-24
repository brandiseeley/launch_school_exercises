# Write a method that takes a string with one or more space separated
# words and returns a hash that shows the number of words of different 
# sizes.

# Words consist of any string of characters that do not include a space.

def word_sizes(sentence)
  words = sentence.split
  words.each_with_object({}) do |word, hsh|
    if hsh.key?(word.length)
      hsh[word.length] += 1
    else
      hsh[word.length] = 1
    end
  end
end



p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
p word_sizes('') == {}

# Modify the word_sizes method from the previous exercise to exclude 
# non-letters when determining word size. For instance, the length of
# "it's" is 3, not 4.


def word_sizes2(sentence)
  words = sentence.split
  words = words.map do |word|
    word.gsub(/[^a-z^A-Z]/, '')
  end

  words.each_with_object(Hash.new(0)) do |word, hsh|
    hsh[word.length] += 1
  end
end

p word_sizes2('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
p word_sizes2('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
p word_sizes2("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
p word_sizes2('') == {}
