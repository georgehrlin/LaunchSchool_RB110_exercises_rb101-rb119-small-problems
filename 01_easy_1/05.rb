require 'pry-byebug'
=begin
Bannerizer
Write a method that will take a short line of text, and print it within a box.

Example:
print_in_box('To boldly go where no one has gone before.')
+--------------------------------------------+
|                                            |
| To boldly go where no one has gone before. |
|                                            |
+--------------------------------------------+

print_in_box('')
+--+
|  |
|  |
|  |
+--+

You may assume that the input will always fit in your terminal window.
=end

=begin
PEDAC
P
Input: A string the length of which will always fit in the terminal window
Output: An output in terminal with the input string "framed" within a box

E
print_in_box('To boldly go where no one has gone before.')
# Output:
+--------------------------------------------+
|                                            |
| To boldly go where no one has gone before. |
|                                            |
+--------------------------------------------+

D
Input: A string
Output: Five strings output in terminal

A
- Append '| ' to the front of input string and ' |' to its end
- Determine length of modified input string
- Output "top frame" consisting '+' and '-' that matches length of modified str
- Output "top gap" consisting '|' and ' ' that matches length of modified str
- Output modified str
- Output "bottom gap" consisting '|' and ' ' that matches length of modified str
- Output "bottom frame" consisting '+' and '-' that matches length of modified str
=end

=begin
def print_in_box(str)
  modified_str = "| #{str} |"
  len = modified_str.length

  puts "+#{'-' * (len - 2)}+"
  puts "|#{' ' * (len - 2)}|"
  puts modified_str
  puts "|#{' ' * (len - 2)}|"
  puts "+#{'-' * (len - 2)}+"
end

print_in_box('To boldly go where no one has gone before.')
=end

# OFFICIAL SOLUTION
=begin
def print_in_box(message)
  horizontal_rule = "+#{'-' * (message.size + 2)}+"
  empty_line = "|#{' ' * (message.size + 2)}|"

  puts horizontal_rule
  puts empty_line
  puts "| #{message} |"
  puts empty_line
  puts horizontal_rule
end
=end

# FURTHER EXPLORATION
# Modify this method so it will truncate the message if it will be too wide to
# fit inside a standard terminal window (80 columns, including the sides of the
# box). For a real challenge, try word wrapping very long messages so they
# appear on multiple lines, but still within a box.

=begin
PEDAC
P
Input: A string, potentially over 80 columns in length
Output: An output of the input string "framed" in a box in terminal

Explicit:
- If an input string is over 80 columns long, wrap it so it appears on multiple
  lines

E
print_in_box('You either take risks and renew yourself year after year, or you slowly become a more anxious version of yourself, there is no in between.')
+-------------------------------------------------------------------------+
|                                                                         |

| You either take risks and renew yourself year after year, or you slowly become |

| You either take risks and renew yourself year after year, or you slowly |
| become a more anxious version of yourself, there is no in between.      |
|                                                                         |
+-------------------------------------------------------------------------+

print_in_box('You don’t need to choose between family and career. They should benefit each other. You become more productive precisely because you have a strong, meaningful reason to work hard year after year, and because you feel supported and loved every day.')
+------------------------------------------------------------------------------+
|                                                                              |
| You don’t need to choose between family and career. They should benefit each |
| other. You become more productive precisely because you have a strong,       |
| meaningful reason to work hard year after year, and because you feel         |
| supported and loved every day.                                               |
|                                                                              |
+-----------------------------------------------------------------------------+

D
In: A string
Out: Output various strings

A
General:
"Split" framed string into three portions. Middle portion is worded portion.
Use an array of strings to represent worded portion.

To create worded portion:
Each element string is a line of framed string <= 80 columns, frames included.
Split up input string into an array of individual terms.
Construct framed strings line by line by iterating over individual terms and
adding to each framed string.
Make sure each line has two ' ' and two '|' on sides and overall does not
exceed length of 80.

Determine longest element string and use its length to build outer frame and
gap.
Finally, put all outer frames and worded portion together.

Precise:
- Initialize worded_portion, an empty array
- Initialize line, ''
- Split input string into an array of individual terms
- Loop over array of terms
  - IF term is last term in array
    - Append ' ' + term to line
    - Append line to worded_portion
  - ELSIF length of line + ' ' + term is less than 76
    - Append term to line
  - Else
    - Append line to worded_portion
    - Reset line to ''
    - Append term to line
- Determine longest element in worded_portion string and store it in a new var
  line_length
- Use line_length to "make up" length of all shorter strings with ' '
- Use line_length to create frame and gap
- Output frame, gap, each element string of worded_portion, gap, frame
=end

def arr_lines(str)
  lines = []
  line = ''
  arr_terms = str.split(' ')
  arr_terms.each do |term|
    if (line + ' ' + term).length <= 78
      if term.object_id == arr_terms.last.object_id
        line += " #{term}"
        lines << line
      else
        line += " #{term}"
      end
    else
      if term.object_id.equal?(arr_terms.last.object_id)
        lines << line
        line = ''
        lines += " #{term}"
        lines << line
      else
        lines << line
        line = ''
        line += " #{term}"
      end
    end
  end
  lines
end

def length_longest_str(arr)
  arr.map { |str| str.length }.max
end

def worded_portion(arr)
  target_length = length_longest_str(arr)
  arr.map do |line|
    line + ' ' * (target_length - line.length)
  end
end

def print_in_box(str)
  arr_transformed = worded_portion(arr_lines(str))
  target_length = length_longest_str(arr_transformed)
  horizontal_rule = "+#{'-' * (target_length + 1)}+"
  empty_line = "|#{' ' * (target_length + 1)}|"

  puts horizontal_rule
  puts empty_line
  arr_transformed.each do |line|
    puts "|#{line} |"
  end
  puts empty_line
  puts horizontal_rule
end

line1 = 'You don’t need to choose between family and career. They should benefit each other. You become more productive precisely because you have a strong, meaningful reason to work hard year after year, and because you feel supported and loved every day.'
print_in_box(line1)

line2 = 'You either take risks and renew yourself year after year, or you slowly become a more anxious version of yourself, there is no in between.'
print_in_box(line2)
