# Write a method that determines the mean (average) of the three scores 
# passed to it, and returns the letter value associated with that grade.



def get_grade(scr1, scr2, scr3)
  average = ( scr1 + scr2 + scr3 ) / 3.0
  if average > 100
    'A+++'
  if average > 90
    'A'
  elsif average > 80
    'B'
  elsif average > 70
    'C'
  elsif average > 60
    'D'
  else
    'F'
  end
end

p get_grade(95, 90, 93) == "A"
p get_grade(50, 50, 95) == "D"
