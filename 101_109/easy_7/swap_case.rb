# Write a method that takes a string as an argument and returns a new 
# string in which every uppercase letter is replaced by its lowercase 
# version, and every lowercase letter by its uppercase version. All other 
# characters should be unchanged.
# You may not use String#swapcase; write your own version of this method.

def swapcase(string)
  index = 0
  loop do
    break if index >= string.size
    if string[index].upcase == string[index]
      string[index] = string[index].downcase
    else
      string[index] = string[index].upcase

    end
    index += 1
  end
  string
end

p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'
