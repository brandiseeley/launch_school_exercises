# Write a method that will take a short line of text,
# and print it within a box.

# print_in_box('To boldly go where no one has gone before.')
# +--------------------------------------------+
# |                                            |
# | To boldly go where no one has gone before. |
# |                                            |
# +--------------------------------------------+

def print_in_box(string)
  top_and_bottom = '+-' + ( '-' * string.length ) + '-+'
  spacer = '| ' + ( ' ' * string.length ) + ' |'
  middle = '| ' + string + ' |'
  puts "%s\n%s\n%s\n%s\n%s" % [top_and_bottom, spacer, middle, spacer, top_and_bottom]
end

print_in_box('hello')
print_in_box('')
print_in_box('hello, this is a longer string')
