# Write a method that takes a string, and returns a new string in which 
# every character is doubled.

def repeater(string)
  final_string = ''
  string.chars.each do |char|
    final_string << ( char * 2 )
  end
  final_string
end

p repeater('Hello') == "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''

# Part 2

# Write a method that takes a string, and returns a new string in which 
# every consonant character is doubled. Vowels (a,e,i,o,u), digits, 
# punctuation, and whitespace should not be doubled.

def double_consonants(string)
  final_string = ''
  string.chars.each do |char|
    if char.match(/(?=[a-zA-Z])([^aeiouAEIOU])/)
      final_string << ( char * 2 )
    else
      final_string << char
    end
  end
  final_string
end

p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""
