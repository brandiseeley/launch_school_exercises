# Stack Machine Interpretation
# This is one of the hardest exercises in this exercise set. It uses both exceptions and Object#send, neither of which we've discussed in detail before now. Think of this exercise as one that pushes you to learn new things on your own, and don't worry if you can't solve it.

# You may remember our Minilang language from back in the RB101-RB109 Medium exercises. We return to that language now, but this time we'll be using OOP. If you need a refresher, refer back to that exercise.

# Write a class that implements a miniature stack-and-register-based programming language that has the following commands:

# n Place a value n in the "register". Do not modify the stack.
# PUSH Push the register value on to the stack. Leave the value in the register.
# ADD Pops a value from the stack and adds it to the register value, storing the result in the register.
# SUB Pops a value from the stack and subtracts it from the register value, storing the result in the register.
# MULT Pops a value from the stack and multiplies it by the register value, storing the result in the register.
# DIV Pops a value from the stack and divides it into the register value, storing the integer result in the register.
# MOD Pops a value from the stack and divides it into the register value, storing the integer remainder of the division in the register.
# POP Remove the topmost item from the stack and place in register
# PRINT Print the register value
# All operations are integer operations (which is only important with DIV and MOD).

# Programs will be supplied to your language method via a string passed in as an argument. Your program should produce an error if an unexpected item is present in the string, or if a required stack value is not on the stack when it should be (the stack is empty). In all error cases, no further processing should be performed on the program.

# You should initialize the register to 0.

class Minilang
  attr_accessor :instructions
  attr_reader :register, :stack
  def initialize(instructions)
    @register = Register.new
    @stack = Stack.new
    @instructions = instructions
  end

  def eval
    begin
      parse_instructions(instructions)
      instructions.each do |instruction|
        case instruction
        when 'PRINT' then print
        when 'PUSH' then push
        when 'ADD' then add
        when 'SUB' then sub
        when 'MULT' then mult
        when 'DIV' then div
        when 'MOD' then mod
        when 'POP' then pop
        else
          n(instruction)
        end
      end
    rescue InvalidTokenError, EmptyStackError => error
      puts error.message
    end
  end

  def n(number_string)
    register.value = number_string.to_i
  end

  def push
    stack.push(register.value)
  end

  def add
    stack_value = stack.pop
    register_value = register.value
    register.value = (stack_value + register_value)
  end

  def sub
    stack_value = stack.pop
    register_value = register.value
    register.value = (register_value - stack_value)
  end

  def mult
    stack_value = stack.pop
    register_value = register.value
    register.value = (stack_value * register_value)
  end

  def div
    stack_value = stack.pop
    register_value = register.value
    register.value = (register_value / stack_value)
  end

  def mod
    stack_value = stack.pop
    register_value = register.value
    register.value = (register_value % stack_value)
  end

  def pop
    new_register_value = stack.pop
    register.value = (new_register_value)
  end

  @@VALID_COMMANDS = %w(PUSH ADD SUB MULT DIV MOD POP PRINT)

  # Input ...
  # Output ...
  # Raises InvalidTokenError if a bad token is found
  def parse_instructions(input)
    commands = input.split
    commands.each do |command|
      # if the command isn't part of valid commands and it isn't an integer
      if !@@VALID_COMMANDS.include?(command) && !command.match(/\A-?[0-9]+\z/)
        raise InvalidTokenError.new(command)
      end
    end
    self.instructions = commands
  end

  def print
    puts register
  end
end

class InvalidTokenError < StandardError
  def initialize(token)
    super("Invalid token: #{token}")
  end
end

class Register
  attr_accessor :value
  def initialize
    @value = 0
  end

  def to_s
    value.to_s
  end
end

class EmptyStackError < StandardError
  def initialize(msg="Empty Stack!")
    super
  end
end

class Stack
  def initialize
    @values = []
  end

  def pop
    raise EmptyStackError if @values.empty?
    @values.shift
  end

  def push(integer)
    @values.prepend(integer)
  end

  def to_s
    @values.to_s
  end

end

Minilang.new('PRINT').eval # 0
puts '--------------------------------'
Minilang.new('5 PUSH 3 MULT PRINT').eval # 15
puts '--------------------------------'
Minilang.new('5 PRINT PUSH 3 PRINT ADD PRINT').eval # 5, 3, 8
puts '--------------------------------'
Minilang.new('5 PUSH 10 PRINT POP PRINT').eval # 10, 5
puts '--------------------------------'
Minilang.new('5 PUSH POP POP PRINT').eval # Empty Stack!
puts '--------------------------------'
Minilang.new('3 PUSH PUSH 7 DIV MULT PRINT ').eval # 6
puts '--------------------------------'
Minilang.new('4 PUSH PUSH 7 MOD MULT PRINT ').eval # 12
puts '--------------------------------'
Minilang.new('-3 PUSH 5 XSUB PRINT').eval # Invalid token: XSUB
puts '--------------------------------'
Minilang.new('-3 PUSH 5 SUB PRINT').eval # 8
puts '--------------------------------'
Minilang.new('6 PUSH').eval # (nothing printed; no PRINT commands)


