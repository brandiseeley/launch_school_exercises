# print_in_box('To boldly go where no one has gone before.')
# +--------------------------------------------+
# |                                            |
# | To boldly go where no one has gone before. |
# |                                            |
# +--------------------------------------------+

# Further Exploration
# Modify this method so it will truncate the message if it will be too
# wide to fit inside a standard terminal window (80 columns, including
# the sides of the box). For a real challenge, try word wrapping very
# long messages so they appear on multiple lines, but still within a box.

# PEDAC
# PROBLEM #
# - take a string and print the string to the console surrounded by a banner
# - the banner should fit on the console width
# - we are considering console width to be 80 characters wide
# - the 80 character width needs to include the banner
# - we should word wrap at spaces, not split words in half

# EXAMPLES #
# print_in_box('To boldly go where no one has gone before.')
# +--------------------------------------------+
# |                                            |
# | To boldly go where no one has gone before. |
# |                                            |
# +--------------------------------------------+
# print_in_box("Modify this method so it will truncate the message if it will be too wide to fit inside a standard terminal window (80 columns, including the sides of the box).")
# +----------------------------------------------------------------------------+
# |                                                                            |
# | Modify this method so it will truncate  the message if it will be too wide |
# | wide to fit inside a standard terminal window (80 columns, including the   |
# | sides of the box).                                                         |
# |                                                                            |
# +----------------------------------------------------------------------------+

# DATA TYPES #
# input : string
# intermediate : array containing strings representing the lines of text properly sized to fit into display
# output : unused return value

# ALGORITHM #
# - split the string into lines => array of strings
#     - MAX_LINE_LENGTH = 76
#     - create lines = []
#     - index = 76
#     - check if the character at string[index] is a space
#     - if it is a space
#         - push string[0, index] into lines array
#         - set string = string[index, -1]
#         - set index = 76
#     - if it isn't a space
#         - index -= 1
#     - return lines array
# - find the length of the longest line
# - use longest line length to create a banner_width variable that should point to an integer
# - NOTE: top_and_bottom, spacer, and each line from the array of lines should ultimately be a length equal to banner_width
# - create the top and bottom line of banner as a string
# - create the 'spacer' lines that are spaces surrounded by '|'
# - iterate over the lines from the array of lines
# -  - mutate the line by prepending '| ' and appending the proper padding followed by '|' to get the desired length line
# - print to console : top_and_bottom, spacer, each line from array of lines, spacer, top_and_bottom

require 'pry-byebug'
MAX_LINE_LENGTH = 76

def split_lines(string)
  lines = []
  index = MAX_LINE_LENGTH
  loop do
    if string.size <= MAX_LINE_LENGTH
      lines << string
      break
    elsif string[index] == ' '
      lines << string[0, index]
      string = string[index, string.length].strip
      index = MAX_LINE_LENGTH
    else
      index -= 1
    end
  end
  lines
end


def print_in_box(string)
  lines = split_lines(string)
  p lines
  banner_width = lines.max_by{ |line| line.size }.size + 4
  
  top_and_bottom = '+' + ( '-' * (banner_width - 2) ) + '+'
  spacer = '|' + ( ' ' * (banner_width - 2) ) + '|'
  
  lines.map! do |line|
    line = '| ' + line
    line = line + ( ' ' * ( banner_width - line.size - 1) ) + '|'
    line
  end
  
  puts top_and_bottom
  puts spacer
  lines.each {|line| puts line}
  puts spacer
  puts top_and_bottom

end

# p split_lines('1234567890 second line')
# p split_lines("Modify this method so it will truncate the message if it will be too wide to fit inside a standard terminal window (80 columns, including the sides of the box).")

print_in_box("Modify this method so it will truncate the message if it will be too wide to fit inside a standard terminal window (80 columns, including the sides of the box).")
print_in_box("Hello")
print_in_box("")

print_in_box("Hello world. This is some text that is more than eighty characters long. Maybe it's better if it's longer.")
print_in_box("Hello world. This is some text that is more than eighty characters long. Maybe it's better if it's longer. Hello world. This is some text that is more than eighty characters long. Maybe it's better if it's longer. Hello world. This is some text that is more than eighty characters long. Maybe it's better if it's longer.")
print_in_box("0123456789012345678901234567890123456789012345678901234567890123456789 bcdef")
print_in_box("0123456789012345678901234567890123456789012345678901234567890123456789 bcdef abc")

### 53 minutes. I'm super proud of this code! It took me 53 minutes from start to finish, including my PEDAC. I didn't account for a word being longer
### than the maximum line, but I handled a lot of other cases very well! 
