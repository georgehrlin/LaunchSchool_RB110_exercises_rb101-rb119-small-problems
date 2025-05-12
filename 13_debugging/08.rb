=begin
Password

The following code prompts the user to set their own password if they haven't
done so already, and then prompts them to login with that password. However,
the program throws an error. What is the problem and how can you fix it?

Once you get the program to run without error, does it behave as expected?
Verify that you are able to log in with your new password.
=end

=begin
password = nil

def set_password
  puts 'What would you like your password to be?'
  new_password = gets.chomp
  password = new_password
end

def verify_password
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
  set_password
end

verify_password
=end

=begin
Without running the faulty code, I think it will always result in an output of
"Authentication failed." because the calling of set_password on line 22 is not
able to reassign password to the new password input by the user. Calling
set_password on line 22 does return the new password, but it must be reassigned
to password. Otherwise password will always be nil.
=end

=begin
Once I fixed the update password issue, I finally noticed that the method
verify_password also contains a bug. When line 64 is reached, because of
verify_password's self-contained scope, password has not been initialized yet.
(At this point, I still haven't run the faulty code, so I am not entirely sure
how it behaves.) For the code to behave as intended, the outer local variable
password must be passed into verify_password as an argument.
=end

# Fix
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
