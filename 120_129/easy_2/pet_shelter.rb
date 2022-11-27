class Pet
  attr_reader :type, :name
  def initialize(type, name)
    @type = type
    @name = name
  end

  def to_s
    "a #{type} named #{name}"
  end
end

class Owner
  attr_reader :name, :pets
  def initialize(name)
    @name = name
    @pets = []
  end

  def number_of_pets
    pets.length
  end

  def to_s
    name
  end

  def add_pet(pet)
    @pets << pet
  end
end

class Shelter
  attr_reader :adoptions, :available_pets
  def initialize
    @adoptions = {}
    @available_pets = []
  end

  def board(pet)
    @available_pets << pet
  end

  def adopt(owner, pet)
    owner.add_pet(pet)
    if adoptions.key?(owner)
      adoptions[owner] << pet
    else
      adoptions[owner] = [pet]
    end
    @available_pets.delete(pet)
  end

  def print_adoptions
    adoptions.each do |owner, pets|
      puts "#{owner} has adopted the following pets:"
      puts pets
    end
  end

  def print_available_pets
    puts "The Animal shelter has #{@available_pets.size} unadopted pets"
  end

end

butterscotch = Pet.new('cat', 'Butterscotch')
pudding      = Pet.new('cat', 'Pudding')
darwin       = Pet.new('bearded dragon', 'Darwin')
kennedy      = Pet.new('dog', 'Kennedy')
sweetie      = Pet.new('parakeet', 'Sweetie Pie')
molly        = Pet.new('dog', 'Molly')
chester      = Pet.new('fish', 'Chester')

phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')

shelter = Shelter.new
shelter.board(butterscotch)
shelter.board(pudding)
shelter.board(darwin)
shelter.board(kennedy)
shelter.board(sweetie)
shelter.board(molly)
shelter.board(chester)
shelter.adopt(phanson, butterscotch)
shelter.adopt(phanson, pudding)
shelter.adopt(phanson, darwin)
shelter.adopt(bholmes, kennedy)
shelter.adopt(bholmes, sweetie)
shelter.print_adoptions
puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."
shelter.print_available_pets
