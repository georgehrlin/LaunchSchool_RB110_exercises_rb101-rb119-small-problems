def say_hi(name = 'Bob')
  puts "Hi, #{name}!"
end

def say_bye(name: 'Bob')
  puts "Bye, #{name}!"
end

say_hi
say_bye

say_hi('George')
say_bye(name: 'George')
