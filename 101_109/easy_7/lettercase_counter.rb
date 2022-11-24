# Write a method that takes a string, and then returns a hash that 
# contains 3 entries: one represents the number of characters in the 
# string that are lowercase letters, one the number of characters that 
# are uppercase letters, and one the number of characters that are neither.

def letter_case_count(string)
  chars = string.chars
  counts = {}
  counts[:lowercase] = chars.count { |c| c.match(/[a-z]/) }
  counts[:uppercase] = chars.count { |c| c.match(/[A-Z]/) }
  counts[:neither] = chars.count { |c| c.match(/[^a-zA-Z]/)}
  counts  
end

p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }
