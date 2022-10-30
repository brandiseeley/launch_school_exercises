# Build a program that displays when the user will retire and
# how many years she has to work till retirement.

# - get age from user
# - get retirement age from user
# - calculate years until retirement
# - get current year
# - calculate year of retirement
# - display current year, year of retirement,
#   and years until retirement to user

puts '>> What is your age?'
age = gets.chomp.to_i
puts '>> At what age would you like to retire?'
retirement_age = gets.chomp.to_i
years_to_retirement = retirement_age - age
current_year = Time.now.year
year_of_retirement = current_year + years_to_retirement

puts "Its #{current_year}. You will retire in #{year_of_retirement}
You only have #{years_to_retirement} years of work to go!"
