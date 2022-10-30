# Write a method that returns true if the string passed as an argument
# is a palindrome, false otherwise. A palindrome reads the same 
# forward and backward. For this exercise, case matters as does 
# punctuation and spaces.

def string_palindrome?(string)
  string == string.reverse
end

p string_palindrome?('madam') == true
p string_palindrome?('Madam') == false          # (case matters)
p string_palindrome?("madam i'm adam") == false # (all characters matter)
p string_palindrome?('356653') == true

# FURTHER EXPLORATION
# Write a method that determines whether an array is palindromic; 
# that is, the element values appear in the same sequence both 
# forwards and backwards in the array. 

def array_palindrome?(array)
  array == array.reverse
end

p array_palindrome?([1,2,3,4,5,6]) == false
p array_palindrome?([1,2,3,4,3,2,1]) == true
p array_palindrome?([1,2,3,4,4,3,2,1]) == true

# Now write a method that determines whether 
# an array or a string is palindromic

def palindrome?(thing)
  thing == thing.reverse
end

p palindrome?([1,2,3,4,5,6]) == false
p palindrome?([1,2,3,4,3,2,1]) == true
p palindrome?([1,2,3,4,4,3,2,1]) == true
p palindrome?('madam') == true
p palindrome?('Madam') == false          # (case matters)
p palindrome?("madam i'm adam") == false # (all characters matter)
p palindrome?('356653') == true

# PART 2
# Write another method that returns true if the string passed 
# as an argument is a palindrome, false otherwise. This time, 
# however, your method should be case-insensitive, and it should
# ignore all non-alphanumeric characters. If you wish, you may
# simplify things by calling the palindrome? method you wrote 
# in the previous exercise.

def case_sensitive_palindrome?(string)
  stripped_string = string.downcase.gsub(/[^a-zA-Z0-9]/, '')
  stripped_string == stripped_string.reverse
end

p case_sensitive_palindrome?('madam') == true
p case_sensitive_palindrome?('Madam') == true           # (case does not matter)
p case_sensitive_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
p case_sensitive_palindrome?('356653') == true
p case_sensitive_palindrome?('356a653') == true
p case_sensitive_palindrome?('123ab321') == false
