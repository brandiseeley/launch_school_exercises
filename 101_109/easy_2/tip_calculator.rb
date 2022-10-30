# Create a simple tip calculator. The program should prompt 
# for a bill amount and a tip rate. The program must compute 
# the tip and then display both the tip and the total amount of the bill.

### PROBLEM
# - get bill total and percent for tip from user
# - calculate tip and bill total with tip
# - present totals to user

### ALGORITHM
# - retrieve bill total from user
# - retrieve percent for tip from user
# - save bill total * tip percent as decimal as tip total
# - save bill total + tip total as bill with tip total
# - print both totals to user

def tip_calculator
  puts "What was the bill total?"
  bill_total = gets.chomp.to_i
  puts "What percentage would you like to tip?"
  tip_percent = gets.chomp.to_i * 0.01

  ### how to add a zero
  tip_total = (bill_total * tip_percent)
  bill_with_tip = (tip_total + bill_total)

  puts "The tip is $%.2f" %tip_total
  puts "The total is $%.2f" %bill_with_tip
end

tip_calculator
