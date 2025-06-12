def crunch(str)
  str.gsub(/(.)\1+/, '\1')
end

=begin
From Matthew Guilliams:
1. (.) looks for and captures a single charactr.
2. \1 then looks to see if the next character is the same as the captured
   character.
3. + at the end of the regex looks for multiple instances of the character in
   the capture group

From Ethan Weiner
The second argument in #gsub ... is a replacement string. Aside from being able
to contain characters to use as a replacement, replacement strings can contain
back-references.

Our replacement string contains the back-reference \1, which will evaluate to
the character used in our capture group.
=end
