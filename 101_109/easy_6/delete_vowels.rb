# Write a method that takes an array of strings, and returns an array
# of the same string values, except with the vowels (a, e, i, o, u)
# removed.

VOWELS = %w(a e i o u)

def remove_vowels(arr)
  arr.map! do |word|
    index = 0
    new_word = ''
    while index < word.size
      new_word << word[index] if !VOWELS.include?(word[index].downcase)
      index += 1 
    end
    new_word
  end
  arr
end

p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']

def remove_vowels_better(arr)
  arr.map do |word|
    word.delete('aeiouAEIOU')
  end
end

p remove_vowels_better(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels_better(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
p remove_vowels_better(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']
