def minilang(program)
  stack = []
  register = 0

  commands = program.split
  commands.each do |command|
    case command
    when 'PUSH'
      stack.push(register)
    when 'ADD'
      register += stack.pop
    when 'SUB'
      register -= stack.pop
    when 'MULT'
      register *= stack.pop
    when 'DIV'
      register /= stack.pop
    when 'MOD'
      register = register % stack.pop
    when 'POP'
      register = stack.pop
    when 'PRINT'
      puts register
    else
      register = command.to_i
    end
  end
end

=begin
# OFFICIAL SOLUTION
def minilang(program)
  stack = []
  register = 0
  program.split.each do |token|
    case token
    when 'ADD'   then register += stack.pop
    when 'DIV'   then register /= stack.pop
    when 'MULT'  then register *= stack.pop
    when 'MOD'   then register %= stack.pop
    when 'SUB'   then register -= stack.pop
    when 'PUSH'  then stack.push(register)
    when 'POP'   then register = stack.pop
    when 'PRINT' then puts reigster
    else         then register = token.to_i
    end
  end
end
=end

=begin
FURTHER EXPLORATION
Try writing a minilang program to evaluate and print the result of this
expression:
(3 + (4 * 5) - 7) / (5 % 3)
=end

minilang(4 )
