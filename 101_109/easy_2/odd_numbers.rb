# Print all odd numbers from 1 to 99, inclusive, to the console, 
# with each number on a separate line.

(1..99).each {|i| puts i if i.odd?}

# further exploration : implement in a different way

odd = (1..99).select {|i| i.odd?}
odd.each {|i| p i}
