# Write a program that will ask for user's name. The program
# will then greet the user. If the user writes "name!"
# then the computer yells back to the user.

# - get name from user
# - check if the name ends with !
# - if name ends with !
#   - remove !
#   - print SCREAMING GREETING
# - if name doesn't end with !
# - print regular greeting

puts 'What is your name?'
name = gets.chomp
if name.end_with?('!')
  name.delete!('!')
  puts "HELLO #{name.upcase}. WHY ARE WE SCREAMING?"
else
  puts "Hello #{name}."
end
