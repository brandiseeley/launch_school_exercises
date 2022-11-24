class Pet
  # changed from attr_reader to attr_accessor for further exploration
  attr_accessor :name

  def initialize(name)
    @name = name.to_s
  end

  def to_s
    "My name is #{@name.upcase}."
  end
end

# name = 'Fluffy'
# fluffy = Pet.new(name)
# puts fluffy.name
# puts fluffy
# puts fluffy.name
# puts name

=begin
OUTPUT:
Fluffy
My name is FLUFFY
FLUFFY
FLUFFY
=end

# Further Exploration
name = 42
fluffy = Pet.new(name)
name += 1
puts fluffy.name
puts fluffy
puts fluffy.name
puts name
