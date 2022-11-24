# Write a method that takes a string argument and returns a new string 
# that contains the value of the original string with all consecutive
# duplicate characters collapsed into a single character. You may not
# use String#squeeze or String#squeeze!.

def crunch(string)
  stored_char = ''
  final_string = ''

  string.chars.each do |char|
  next if char == stored_char
  final_string << char
  stored_char = char
  end

  final_string
end

p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''

# Further Exploration

def fancy_crunch(string)
  string.gsub(/(.)\1+/, '\1')
end

p fancy_crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p fancy_crunch('4444abcabccba') == '4abcabcba'
p fancy_crunch('ggggggggggggggg') == 'g'
p fancy_crunch('a') == 'a'
p fancy_crunch('') == ''
