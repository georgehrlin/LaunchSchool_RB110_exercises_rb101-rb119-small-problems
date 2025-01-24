def print_in_box(str)
  puts <<~BOX
    +-#{'-' * str.size}-+
    | #{' ' * str.size} |
    | #{str} |
    | #{' ' * str.size} |
    +-#{'-' * str.size}-+
  BOX
end

line1 = 'To boldly go where no one has gone before.'
print_in_box(line1)
line2 = 'You either take risks and renew yourself year after year, or you slowly become a more anxious version of yourself, there is no in between.'
print_in_box(line2)
