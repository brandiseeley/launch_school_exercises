# Write a method that takes a string as an argument, and returns true if 
# all parentheses in the string are properly balanced, false otherwise. 
# To be properly balanced, parentheses must occur in matching '(' and ')' 
# pairs.

# properly balanced rules
# - when we find an closed parentheses, there must always be an open
#   one already
# - putting a closed parentheses eats an opening one
# - at the end of the string, there should be no parenthesis stored

def balanced?(string, character)
  left = character[0]
  right = character[1]

  open = 0
  string.chars.each do |char|
    if char == left
      open += 1
    elsif char == right
      open -= 1
      break if open < 0
    end
  end
  open == 0
end

# Further Exploration
# There are a few other characters that should be matching as well. 
# Square brackets and curly brackets normally come in pairs. Quotation
# marks(single and double) also typically come in pairs and should be 
# balanced. Can you expand this method to take into account those 
# characters?

# - find first opening character
# - 

SPECIAL_CHARS = %w( ( ) [ ] { } )
OPENS = ['(', '[', '{']

def all_balanced?(string)
  chars = string.chars
  open_chars = []
  chars.each do |char|
    if SPECIAL_CHARS.include?(char)
      if OPENS.include?(char)
        open_chars << char
      else
        if open_chars[-1] == opposing(char)
          open_chars.pop
        else
          puts "This thing is broken!"
          return false
        end
      end
    end
  end
  true
end

def opposing(char)
  case char
  when '(' then ')'
  when ')' then '('
  when '[' then ']'
  when ']' then '['
  when '{' then '}'
  when '}' then '{'
  end
end

# p all_balanced?(' []  (  )   ') == true
# p all_balanced?('( ( ) [ ] ( ) )') == true
# p all_balanced?('( (.) [.] ) )') == false
# p all_balanced?('(..[.)(.]..)') == false
# p all_balanced?('(lets{}see) (does[triple{nesting}break]it)') == true
# p all_balanced?('(lets{}see) (does)[triple{nesting}break]it)') == false
  
# p balanced?('What (is) this?', '()') == true
# p balanced?('What is) this?', '()') == false
# p balanced?()
# p balanced?('What (is this?') == false
# p balanced?('((What) (is this))?') == true
# p balanced?('((What)) (is this))?') == false
# p balanced?('Hey!') == true
# p balanced?(')Hey!(') == false
# p balanced?('What ((is))) up(') == false
