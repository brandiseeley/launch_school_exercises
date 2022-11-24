module Towable
  def tow
    puts 'I can tow a trailer!'
  end
end

class Vehicle
  attr_reader :year

  def initialize(year)
    @year = year
  end

  def start_engine
    'Ready to go!'
  end
end

class Truck < Vehicle
  include Towable
  attr_reader :bed_type

  def initialize(year=1, bed_type='short')
    super(year)
    @bed_type = bed_type
  end

  def start_engine(speed)
    super() + "Ready to go! Drive #{speed}, please!"
  end
end

class Car < Vehicle
end

# truck1 = Truck.new(1994, 'Short')
# puts truck1.year
# puts truck1.bed_type

# car1 = Car.new(2006)
# puts car1.year

# truck1 = Truck.new(1994, 'short')
# puts truck1.start_engine('fast')

# truck1 = Truck.new
# truck1.tow

# truck1 = Truck.new(1994)
# puts truck1.year
# puts truck1.tow

# car1 = Car.new(2006)
# puts car1.year
