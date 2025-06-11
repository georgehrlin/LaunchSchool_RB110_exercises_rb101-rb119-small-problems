password = nil

def set_password
  puts 'What would you like your password to be?'
  gets.chomp
end

def verify_password(password)
  puts '** Login **'
  print 'Password: '
  input = gets.chomp

  if input == password
    puts 'Welcome to the inside!'
  else
    puts 'Authentication failed.'
  end
end

if !password
  password = set_password
end

verify_password(password)

=begin
There are two problems with the original code:
1. The set_password method is not defined to take an argument. The password
   on line 6 is a separate variable that is local only to the method
   definition. For set_password to work properly, the password local to the
   outer scope must be reassigned the return value of set_password.
2. The verify_password method is also defined to not take an argument. This
   results in a NameError because password on line 14 is not created yet due to
   the method definition's self-contained scope. To fix this issue, the
   password local to the outer scope must be passed to verify_password as an
   argument.
=end
