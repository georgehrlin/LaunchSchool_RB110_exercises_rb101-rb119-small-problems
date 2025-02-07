NEW_LINE_COL = 78
NEW_LINE = "|\n| ".freeze

def print_line(endchar, middle, reps, pad = 0)
  print endchar
  reps.times { print middle }
  pad.times { print ' ' }
  print endchar + "\n"
end

def print_break(str)
  words = str.split
  print '| '
  col = 0

  while words.size > 0
    words = words.shift
    if col + 
  end
end