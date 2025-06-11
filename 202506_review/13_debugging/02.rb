def shout_out_to(name)
  name.upcase!

  puts 'HEY ' + name
end

shout_out_to('you')

=begin
The buggy original code snippet outputs HEY you because chars returns a new
array of individual characters of the name string . Therefore, upcase! is
called on and mutates the elements of this new array, not on the name string.
=end

# OFFICIAL SOLUTION
def shout_out_to(name)
  puts 'HEY ' + name.upcase
end
