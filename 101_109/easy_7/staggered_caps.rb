# Write a method that takes a String as an argument, and returns a new 
# String that contains the original value using a staggered capitalization 
# scheme in which every other character is capitalized, and the remaining 
# characters are lowercase. Characters that are not letters should not 
# be changed, but count as characters when switching between upper and 
# lowercase.

def staggered_case(string, start_upcase=true, ignore_punc=true)
  odd = start_upcase
  chars = string.chars.map do |char|
    if char.match(/[^a-zA-Z]/) && ignore_punc
      next char
    end
    if odd
      next_char = char.upcase
    else
      next_char = char.downcase
    end
    odd = !odd
    next_char
  end
  chars.join
end

p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS') == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'
# Further Exploration
p staggered_case('I Love Launch School!', false) == 'i LoVe LaUnCh ScHoOl!'

# Part 2 Further Exploration
p staggered_case('I Love Launch School!', true, false) == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS', true, false) == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers', true, false) == 'IgNoRe 77 ThE 444 NuMbErS'
