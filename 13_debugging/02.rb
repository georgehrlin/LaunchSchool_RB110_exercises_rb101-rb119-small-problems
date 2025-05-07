=begin
HEY YOU!

String#upcase! is a destructive method, so why does this code print HEY you 
instead of HEY YOU?
Modify the code so that it produces the expected output.
=end

def shout_out_to(name)
  name.chars.each { |c| c.upcase! }

  puts 'HEY ' + name
end

shout_out_to('you') # expected: 'HEY YOU'

=begin
On line 15, shout_out_to is called with 'you' as the argument. The method
parameter name is then assigned 'you'. Once line 10 is reached, the method
#chars is first called on name before being chained with #each. Even though
#upcase! is a mutating method, it fails to mutate the characters of name
because #chars returns a new array of strings. Therefore, upcase! ends up
mutating the individual strings in this new array instead of 'you'.
=end

# Fix
def shout_out_to(name)
  name.upcase!

  puts 'HEY ' + name
end

shout_out_to('you')
