# Write a method that returns a list of all substrings of a string that 
# are palindromic. That is, each substring must consist of the same 
# sequence of characters forwards as it does backwards. The return value 
# should be arranged in the same sequence as the substrings appear in the 
# string. Duplicate palindromes should be included multiple times.

# You may (and should) use the substrings method you wrote in the previous 
# exercise.

# For the purposes of this exercise, you should consider all characters 
# and pay attention to case; that is, "AbcbA" is a palindrome, but neither 
# "Abcba" nor "Abc-bA" are. In addition, assume that single characters are 
# not palindromes.


def leading_substrings(string)
  substrings = []
  string.size.times do |i|
    substrings << string[0, i + 1 ]
  end
  substrings
end

def substrings(string)
  substrings = []
  string.size.times do |i|
    substrings << leading_substrings(string[i..string.size])
  end
  substrings.flatten
end

def palindromes(string)
  all_substrings = substrings(string)
  palindromes = []
  all_substrings.each do |substring|
    if substring == substring.reverse && substring.size > 1
      palindromes << substring
    end
  end
  palindromes
end

p palindromes('abcd') == []
p palindromes('madam') == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
p palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]

# Further Exploration

# Can you modify this method (and/or its predecessors) to ignore 
# non-alphanumeric characters and case? Alphanumeric characters are 
# alphabetic characters(upper and lowercase) and digits.

def ignore_punc_palindromes(string)
  all_substrings = substrings(string)
  palindromes = []
  all_substrings.each do |substring|
    if is_palindrome_no_punc?(substring)
      palindromes << substring
    end
  end
  palindromes
end

def is_palindrome_no_punc?(string)
  stripped = string.gsub(/[^a-zA-Z]/, '')
  stripped.reverse == stripped && stripped.length > 1
end

p ignore_punc_palindromes('a.ba') == ["a.ba"]
p ignore_punc_palindromes("wub'buw") == ["wub'buw", "ub'bu", "b'b"]
