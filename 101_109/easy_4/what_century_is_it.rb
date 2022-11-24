# Write a method that takes a year as input and returns the century. 
# The return value should be a string that begins with the century 
# number, and ends with st, nd, rd, or th as appropriate for that 
# number.

### PROBLEM ###
# take a year as an integer and output a string representing century
# a century starts in years ending with 01 up to the next 100th
# the century string should have appropriate suffix, th, st, rd, etc

### EXAMPLES ###
# century(2000) == '20th'
# century(2001) == '21st'
# century(1965) == '20th'
# century(256) == '3rd'
# century(5) == '1st'
# century(10103) == '102nd'
# century(1052) == '11th'
# century(1127) == '12th'
# century(11201) == '113th'

### DATA STRUCTURES ###
# integer => string

### ALGORITHM ###
# - determine the century represented by the string
#     - divide the number by 100, save result
#     - unless the number ends in 00
#       - add 1 to the result
# - format our result into a string with proper suffix
#     - check if the given integer is in IRREGULAR_ORDINALS
#     - if it is, to string and suffix 'th' , return
#     - otherwise
#     - extract the last digit of the century integer
#     - if 1, 'st', if 2, 'nd', if 3, 'rd', otherwise, 'th'
#     - to string, add suffix, return

IRREGULAR_ORDINALS = ['11', '12', '13']

def century(year)
  century = year / 100
  unless year.to_s.end_with?('00')
    century += 1
  end
  century.to_s + ordinal_suffix(century)
end

def ordinal_suffix(century_int)
  century_str = century_int.to_s
  if century_str.end_with?(*IRREGULAR_ORDINALS)
    'th'
  else
    last_digit = century_str[-1].to_i
    case last_digit
    when 1 then 'st'
    when 2 then 'nd'
    when 3 then 'rd'
    else 'th'
    end
  end
end

p century(2000) == '20th'
p century(2001) == '21st'
p century(1965) == '20th'
p century(256) == '3rd'
p century(5) == '1st'
p century(10103) == '102nd'
p century(1052) == '11th'
p century(1127) == '12th'
p century(11201) == '113th'
