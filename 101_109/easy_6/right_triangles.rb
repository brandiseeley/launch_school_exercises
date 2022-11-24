# Write a method that takes a positive integer, n, as an argument, and 
# displays a right triangle whose sides each have n stars. The hypotenuse 
# of the triangle (the diagonal side in the images below) should have one 
# end at the lower-left of the triangle, and the other end at the 
# upper-right.

def triangle(side, upside_down=false, corner_to_right=true)
  indices = (0..side-1).to_a
  indices.reverse! if upside_down

  if corner_to_right
    indices.each do |i|
      puts ' ' * ( side - ( i + 1 ) ) + '*' * ( i + 1 )
    end
  else
    indices.each do |i|
      puts '*' * ( i + 1 ) + ' ' * ( side - ( i + 1 ) )
    end
  end
end

triangle(5)
triangle(5, true)
triangle(9)
triangle(9, true)
triangle(5, false, false)
triangle(5, true, false)

# Further Exploration
# Try modifying your solution so it prints the triangle upside down from 
# its current orientation. Try modifying your solution again so that you 
# can display the triangle with the right angle at any corner of the grid.
