# A code dump of excercises that weren't significant enough
# to warrant their own file

#### RB101-109 Small Problems ####

## EASY 1 ##

# Odd
def is_odd?(integer)
  integer % 2 == 1
end

puts is_odd?(2)    # => false
puts is_odd?(5)    # => true
puts is_odd?(-17)  # => true
puts is_odd?(-8)   # => false
puts is_odd?(0)    # => false
puts is_odd?(7)    # => true
