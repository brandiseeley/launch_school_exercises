# Write a program that reads the content of a text file and then prints 
# the longest sentence in the file based on number of words. Sentences 
# may end with periods (.), exclamation points (!), or question marks (?). 
# Any sequence of characters that are not spaces or sentence-ending 
# characters should be treated as a word. You should also print the number 
# of words in the longest sentence.

def split_sentences(text)
  sentences = []
  sentence = []
  text.split.each do |word|
    if word.end_with?('.', '?', '!')
      sentence << word
      sentences << sentence.join(' ')
      sentence = []
    else
      sentence << word
    end
  end
  sentences
end

def longest_sentence(filename)
  file = File.open(filename)
  text = file.read
  sentences = split_sentences(text)
  longest_sentence = sentences.max do |a, b|
    a.split.size <=> b.split.size
  end
  p longest_sentence
  puts "Word count: #{longest_sentence.split.size}"
end

# longest_sentence('four_score.txt')
# longest_sentence('frankenstein.txt')

# Further Exploration
# What about finding the longest paragraph or longest word? How would we 
# go about solving that problem?

def longest_word(filename)
  file = File.open(filename)
  words = file.read.split
  longest = words.max_by { |word| word.length }
  puts "The longest word in #{filename} is : #{longest}, with #{longest.length} characters."
end

def split_paragraphs(text)
  paragraphs = []
  paragraph = []
  text.each_line do |line|
    if line == "\n"
      paragraphs << paragraph.join(' ')
      paragraph = []
    else
      paragraph << line
    end
  end
  paragraphs << paragraph.join(' ')
  paragraphs
end

# prints longest paragraph based on word count and displays word count
def longest_paragraph(filename)
  file = File.open(filename)
  text = file.read
  paragraphs = split_paragraphs(text)
  longest_paragraph = paragraphs.max do |a, b|
    a.split.size <=> b.split.size
  end
  p longest_paragraph
  puts "Word count: #{longest_paragraph.split.size}"
end

# longest_paragraph('four_score.txt')
# longest_paragraph('frankenstein.txt')

# # Returns the url from frankenstein. Not wrong.
# longest_word('four_score.txt')
# longest_word('frankenstein.txt')
