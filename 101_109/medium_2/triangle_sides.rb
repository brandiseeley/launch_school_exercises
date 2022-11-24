# A triangle is classified as follows:

# equilateral All 3 sides are of equal length
# isosceles 2 sides are of equal length, while the 3rd is different
# scalene All 3 sides are of different length
# To be a valid triangle, the sum of the lengths of the two shortest 
# sides must be greater than the length of the longest side, and all 
# sides must have lengths greater than 0: if either of these conditions 
# is not satisfied, the triangle is invalid.

# Write a method that takes the lengths of the 3 sides of a triangle as 
# arguments, and returns a symbol :equilateral, :isosceles, :scalene, or 
# :invalid depending on whether the triangle is equilateral, isosceles, 
# scalene, or invalid.

# sides must be sorted
def is_valid?(sides)
  (sides[0] + sides[1]) > sides[2] && sides.none? { |side| side == 0 }
end

def triangle(s1, s2, s3)
  sides = [s1, s2, s3].sort
  if !is_valid?(sides)
    :invalid
  elsif
    sides.uniq == sides
    :scalene
  elsif
    sides.uniq.size == 2
    :isosceles
  else
    :equilateral
  end
end


p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid
