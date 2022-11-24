# Write a method that takes a single String argument and returns a new 
# string that contains the original value of the argument with the first 
# character of every word capitalized and all other letters lowercase.

# You may assume that words are any sequence of non-blank characters.

def word_cap(string)
  string.split.each { |word| word.capitalize! }.join(' ')
end

p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The Javascript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'

# check that we haven't mutated original string
string = "we shouldn't mutate things unless we mean to"
new_string = word_cap(string)
puts string == "we shouldn't mutate things unless we mean to"

# Further Exploration

def word_cap2(string)
  index = 0
  loop do
    break if index == string.size
    if index == 0
      string[0] = string[0].upcase
    else
      if string[index-1] == ' '
        string[index] = string[index].upcase
      else
        string[index] = string[index].downcase
      end
    end
    index += 1
  end
  string
end

p word_cap2('four score and seven') == 'Four Score And Seven'
p word_cap2('the javaScript language') == 'The Javascript Language'
p word_cap2('this is a "quoted" word') == 'This Is A "quoted" Word'
