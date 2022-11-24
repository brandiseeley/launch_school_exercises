# Write a method that takes a sentence string as input, and returns the 
# same string with any sequence of the words 'zero', 'one', 'two', 
# 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine' converted to 
# a string of digits.

# Further Exploration
# Can you change your solution so that the spaces between consecutive 
# numbers are removed? Suppose the string already contains two or more 
# space separated numbers (not words); can you leave those spaces alone, 
# while removing any spaces between numbers that you create?

# What about dealing with phone numbers? Is there any easy way to format 
# the result to account for phone numbers? For our purposes, assume that 
# any 10 digit number is a phone number, and that the proper format should 
# be "(123) 456-7890".

### NOTE: I implemented this first following the requirement that the
#         original string be mutated and returned. When I went into the
#         further exploration part of the problem, I utilized the replace
#         method, so I wasn't mutating the string in place, I was just
#         replacing the object after making a bunch of changes. Finally
#         I reworked my mess of code a third time I decided to leave 
#         behind the requirement of mutating the string and return a new one

def tokenize(string)
  string.gsub(/(\w+)([!\.;:]+)/, '\1 \2').split
end

PUNCTUATION = %w(: . !)
NUMBER_TOKENS = { 'zero' => '0', 'one' => '1', 'two' => '2', 'three' => '3',
                  'four' => '4', 'five' => '5', 'six' => '6', 'seven' => '7',
                  'eight' => '8', 'nine' => '9' }


def word_to_digit(string)
  tokens = tokenize(string)

  formatted_string = ''
  last_token_was_num = false

  tokens.each do |token|
    if PUNCTUATION.include?(token[0])
      formatted_string << token
      last_token_was_num = false

    elsif last_token_was_num
      if NUMBER_TOKENS.keys.include?(token)
        formatted_string << NUMBER_TOKENS[token]
      else
        formatted_string << ' ' + token
        last_token_was_num = false
      end

    elsif !last_token_was_num
      if NUMBER_TOKENS.keys.include?(token)
        formatted_string << ' ' + NUMBER_TOKENS[token]
        last_token_was_num = true
      else
        formatted_string << ' ' + token
      end
    end
  end
format_phone_numbers(formatted_string.strip)
end

def format_phone_numbers(string)
  string.gsub(/(\d{3})(\d{3})(\d{4})/,'(\1) \2-\3')
end

p word_to_digit('Please call 1 2 or zero zero.')
p word_to_digit('Please call 1 2 3 me at five five five one two three four. Thanks.')
p word_to_digit('My name is Brandi and I can count 1 2 3...my phone number is three four zero two four four four seven zero five!!!')
