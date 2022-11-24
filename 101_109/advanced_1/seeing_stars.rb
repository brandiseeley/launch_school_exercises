# Write a method that displays an 8-pointed star in an nxn grid, where n is an 
# odd integer that is supplied as an argument to the method. The smallest such 
# star you need to handle is a 7x7 grid.
# star(7)

# *--*--*   # 3 stars in every line except the middle
# -*-*-*-   # spaces between stars start at 0, then 1, then two, until the end
# --***--   # space around stars = input num
# *******   
# --***--
# -*-*-*-
# *--*--*

def star(size)
  half = size / 2
  half.downto(1) do |i|
    edge = ' ' * (half - i)
    buffer = ' ' * (i - 1)
    line = edge + '*' + buffer + '*' + buffer + '*' + edge
    puts line
  end
  puts '*' * size
  1.upto(half) do |i|
    edge = ' ' * (half - i)
    buffer = ' ' * (i - 1)
    line = edge + '*' + buffer + '*' + buffer + '*' + edge
    puts line
  end
end

# star(9)
                    
# ----*--*----  4 * 2 * 4
# -*--------*-  1 * 8 * 1
# *----------*  0 * 10 * 0
# *----------*  0 * 10 * 0
# -*--------*-  1 * 8 * 1
# ----*--*----  4 * 2 * 4

# minimum height of 6, would need to add more mid lines for bigger circles
def circle(height)
  width = height + 4
  top = ' ' * (width/2 - 1) + '*  *' + ' ' * (width/2 - 1)
  mid = ' ' + '*' + ' ' * (width - 2) + '*'
  middle = '*' + ' ' * (width) + '*'
  puts top
  puts mid
  puts middle
  puts middle
  puts mid
  puts top
end

# circle(6)
# circle(8)

### TODO ###
# def sine_wave(height)
# middle = ('*' + ' ' * height) * 5
# 1.upto(height) do |i|
#   width = height - 2
#   row = width 

# end

# sine_wave(3)
