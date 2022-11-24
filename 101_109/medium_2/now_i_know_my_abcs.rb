# A collection of spelling blocks has two letters per block, as shown 
# in this list:

# B:O   X:K   D:Q   C:P   N:A
# G:T   R:E   F:S   J:W   H:U
# V:I   L:Y   Z:M

# This limits the words you can spell with the blocks to just those 
# words that do not use both letters from any given block. Each letter 
# in each block can only be used once.

# Write a method that returns true if the word passed in as an argument 
# can be spelled from this set of blocks, false otherwise.
PAIRS = %w( BO XK DQ CP NA GT RE FS JW HU VI LY ZM )

def block_word?(word)
  word = word.upcase
  return false if word.split != word.split.uniq
  PAIRS.none? { |block| word.count(block) > 1 }
end

p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true
p block_word?('bubble') == false
p block_word?('BATCHB') == false
