=begin
def minilang(command_input)
  stack = []
  register = 0
  commands = command_input.split

  commands.each do |command|
    case
    when command.to_i.to_s == command
      register = command.to_i
    when command == 'PUSH'
      stack << register
    when command == 'ADD'
      register += stack.pop
    when command == 'SUB'
      register -= stack.pop
    when command == 'MULT'
      register *= stack.pop
    when command == 'DIV'
      register /= stack.pop
    when command == 'MOD'
      register %= stack.pop
    when command == 'POP'
      register = stack.pop
    when command == 'PRINT'
      puts register
    else
      puts "INVALID COMMAND"
    end
  end
end
=end

# FURTHER EXPLORATION
# Problem 1: (3 + (4 * 5) - 7) / (5 % 3)
# minilang('3 PUSH 5 MOD PUSH 7 PUSH 4 PUSH 5 MULT PUSH 3 ADD SUB DIV')

=begin
Problem 2: Add some error handling to your method. In particular, have the
method detect empty stack conditions, and invalid tokens in the program, and
report those. Ideally, the method should return an error message if an error
occurs, and nil if the program runs successfully.
=end

def invalid_token_when_empty_stack?(token, stack)
  ['ADD', 'SUB', 'MULT', 'DIV', 'MOD', 'POP'].include?(token) && stack.empty?
end

def valid_token?(token, stack)
  ['ADD', 'SUB', 'MULT', 'DIV', 'MOD', 'POP', 'PUSH', 'PRINT']
  .include?(token) || token.to_i.to_s == token
end

def minilang(program)
  stack = []
  register = 0
  tokens = program.split

  tokens.each do |token|
    unless valid_token?(token, stack)
      puts 'ERROR: INVALID TOKEN'
      break
    end

    if invalid_token_when_empty_stack?(token, stack)
      puts 'ERROR: STACK IS EMPTY'
      break
    end

    case token
    when 'ADD'   then register += stack.pop
    when 'SUB'   then register -= stack.pop
    when 'MULT'  then register *= stack.pop
    when 'DIV'   then register /= stack.pop
    when 'MOD'   then register %= stack.pop
    when 'POP'   then stack.pop
    when 'PUSH'  then stack << register.to_i
    when 'PRINT' then puts register
    else              register = token.to_i
    end
  end

  nil
end

minilang('3 PUSH 5 MOD PUSH 7 PUSH 4 PUSH 5 MULT PUSH 3 ADD SUB DIV PRINT')
minilang('3 PUSH 5 MOD PUSH POP 3 MULT')
minilang('3 PUSH LOL')
