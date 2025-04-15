=begin
Further Exploration

There are a few other characters that should be matching as well.
Square brackets and curly brackets normally come in pairs.
Quotation marks(single and double) also typically come in pairs and should be
balanced. Can you expand this method to take into account those characters?
=end

def balanced?(str)
  brackets = 0
  parens = 0
  quots = 0

  str.each_char do |char|
    brackets += 1 if char == '['
    brackets -= 1 if char == ']'
    break if brackets < 0

    parens += 1 if char == '('
    parens -= 1 if char == ')'
    break if parens < 0

    quots += 1 if char == '"'
  end

  brackets.zero? && parens.zero? && quots.even?
end

p balanced?('[xd]')
p balanced?(']xd[]')
p balanced?('[xd])()')
p balanced?('"xd""')
