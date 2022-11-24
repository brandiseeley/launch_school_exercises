# Write a method that returns the number of Friday the 13ths in the 
# year given by an argument. You may assume that the year is greater 
# than 1752 (when the United Kingdom adopted the modern Gregorian 
# Calendar) and that it will remain in use for the foreseeable future.
require 'date'

def friday_13th(year)
  counts = 0
  day = Date.new(year)
  until day.friday?
    day = day + 1
  end
  while day.year == year do
    if day.mday == 13
      counts += 1
      day += 7
    else
      day += 7
    end
  end
  counts
end

p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2

# Further Exploration
# An interesting variation on this problem is to count the number of 
# months that have five Fridays. This one is harder than it sounds 
# since you must account for leap years.

def months_with_5_fridays(year)
  months_friday = Hash.new(0)
  day = Date.new(year)
  while day.year == year
    if day.friday?
      months_friday[day.month] += 1
    end
    day = day + 1
  end
  months_friday
end

p months_with_5_fridays(2036) # 2036 has a leap day on friday
