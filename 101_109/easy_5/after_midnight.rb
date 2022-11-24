# The time of day can be represented as the number of minutes before or
# after midnight. If the number of minutes is positive, the time is after
# midnight. If the number of minutes is negative, the time is before
# midnight.

# Write a method that takes a time using this minute-based format and
# returns the time of day in 24 hour format (hh:mm). Your method should 
# work with any integer input.

# positive numbers first
# convert the number into hours and minutes
#
require 'pry-byebug'

def time_of_day(number)

  number = number % 1440

  hours = number / 60
  minutes = number % 60
  
  time_format(hours, minutes)
end


def time_format(hours, minutes)
  hr_str = hours.to_s
  mn_str = minutes.to_s

  hr_str.prepend '0' if hr_str.length == 1
  mn_str.prepend '0' if mn_str.length == 1

  hr_str + ':' + mn_str
end

p time_of_day(0) == "00:00"
p time_of_day(-3) == "23:57"
p time_of_day(35) == "00:35"
p time_of_day(-1437) == "00:03"
p time_of_day(3000) == "02:00"
p time_of_day(800) == "13:20"
p time_of_day(-4231) == "01:29"

# As seen in the previous exercise, the time of day can be represented 
# as the number of minutes before or after midnight. If the number of 
# minutes is positive, the time is after midnight. If the number of 
# minutes is negative, the time is before midnight.

# Write two methods that each take a time of day in 24 hour format, and
# return the number of minutes before and after midnight, respectively.
# Both methods should return a value in the range 0..1439.

def after_midnight(time)
  hour, min = extract_hr_min(time)
  
  (hour * 60 + min) % 1440
end

def before_midnight(time)
  ( 1440 - after_midnight(time) ) % 1440
end

def extract_hr_min(time_str)
  hour = time_str[0, 2].to_i
  min = time_str[3, 2].to_i
  [hour, min]
end

p after_midnight('00:00') == 0
p before_midnight('00:00') == 0
p after_midnight('12:34') == 754
p before_midnight('12:34') == 686
p after_midnight('24:00') == 0
p before_midnight('24:00') == 0
