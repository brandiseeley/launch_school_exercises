# Make a madlibs program that reads in some text from a text file that you have 
# created, and then plugs in a selection of randomized nouns, verbs, adjectives, 
# and adverbs into that text and prints it. You can build your lists of nouns, 
# verbs, adjectives, and adverbs directly into your program, but the text data 
# should come from a file or other external source. Your program should read 
# this text, 
# and for each line, it should place random words of the appropriate types into the 
# text, and print the result.
WORD_BANK = { adjective: %w(quick lazy sleepy ugly unruly awful sweet),
              noun: %w(fox dog head leg turtle sock phone),
              verb: %w(jumps lifts bites licks annoys moves),
              adverb: %w(easily lazily noisily excitedly painfully)}

def madlibs(filename)
  text = File.open(filename)
  text.each_line do |line|
    line.gsub!(/%{adjective}/, get_rand_word(:adjective))
    line.gsub!(/%{noun}/, get_rand_word(:noun))
    line.gsub!(/%{verb}/, get_rand_word(:verb))
    line.gsub!(/%{adverb}/, get_rand_word(:adverb))
    puts line
  end

end

def get_rand_word(type_sym)
  WORD_BANK[type_sym].sample
end

madlibs('madlibs_text.txt')
puts "----------------------"
madlibs('my_boyfriend.txt')
