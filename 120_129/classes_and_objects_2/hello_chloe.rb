class Cat
  attr_accessor :name

  @@total_cats = 0

  COLOR = 'purple'

  def self.generic_greeting
    puts "Hello! I'm a cat!"
  end

  def self.total
    puts "There are #{@@total_cats} cats!"
  end

  def initialize(name='unnamed')
    @name = name
    @@total_cats += 1
  end

  def to_s
    "I'm #{name}"
  end

  def rename(new_name)
    self.name = new_name
  end

  def identify
    self
  end

  def personal_greeting
    puts "Hello! My name is #{name} and I'm a #{COLOR} cat!"
  end
end

kitty = Cat.new('Sophie')
# p kitty.name
# p kitty.rename('Chloe')
# p kitty.name

# p kitty.identify

# Cat.generic_greeting
# kitty.personal_greeting

# kitty1 = Cat.new
# kitty2 = Cat.new

# Cat.total

# puts kitty
