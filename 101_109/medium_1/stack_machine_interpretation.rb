VALID_TOKENS = %w(PUSH ADD SUB MULT DIV MOD POP PRINT)
def n(register, value)
  register[0] = value
end

def push(register, stack)
  stack.push(register[0])
end

def add(register, stack)
  value = stack.pop
  raise 'EmptyStackError' if value == nil
  register[0] += value
end

def sub(register, stack)
  value = stack.pop
  raise 'EmptyStackError' if value == nil
  register[0] -= value
end

def mult(register, stack)
  value = stack.pop
  raise 'EmptyStackError' if value == nil
  register[0] = register[0] * value
end

def div(register, stack)
  value = stack.pop
  raise 'EmptyStackError' if value == nil
  register[0] = register[0] / value
end

def mod(register, stack)
  value = stack.pop
  raise 'EmptyStackError' if value == nil
  register[0] = register[0] % value
end

def pop(register, stack)
  register[0] = stack.pop
end

def print(register)
  p register[0]
end

# This doesn't account for an entry being a combination of numbers and letters
def is_num?(string)
  string.match(/-?\d/)
end

# 5 PUSH 3 MULT PRINT
def minilang(string)
  register = [0]
  stack = []
  commands = string.split
  commands.each do |command|
    puts "current register: #{register}, stack: #{stack}"
    puts command
    if is_num?(command)
      n(register, command.to_i)
    else
      raise 'InvalidTokenError' if !VALID_TOKENS.include?(command)
      case command
      when 'PUSH' then push(register, stack)
      when 'ADD' then add(register, stack)
      when 'SUB' then sub(register, stack)
      when 'MULT' then mult(register, stack)
      when 'DIV' then div(register, stack)
      when 'MOD' then mod(register, stack)
      when 'POP' then pop(register, stack)
      when 'PRINT' then print(register)
      end
    end
  end
  nil
end

# Further exploration
# Try writing a minilang program to evaluate and print the result 
# of this expression:
# (3 + (4 * 5) - 7) / (5 % 3)

# minilang('3 PUSH 5 MOD PUSH 7 PUSH 4 PUSH 5 MULT PUSH 3 ADD SUB DIV PRINT')

# minilang('ADD')
# minilang('not a token')
