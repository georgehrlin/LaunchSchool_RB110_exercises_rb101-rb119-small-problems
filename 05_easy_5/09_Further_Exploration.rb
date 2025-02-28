=begin
Q: You may have noticed that we continue iterating until index points past the
end of the string. As a result, on the last iteration text[index] is the last
character in text, while text[index + 1] is nil. Why do we do this? What
happens if we stop iterating when index is equal to text.length?

A: text[index + 1] does go past the end of the string, but making sure
text[index] reaches the last character of the string makes sure that the
crunch_text string that will be returned includes that last character.

Also, for an argument string like "ggg", if text[index] doees not reach the
last character, nothing would be added to the crunch_text string. Having
text[index + 1] points to nil actually allows one "g" character is added to
crunch_text.
=end

=begin
Q: What happens if we stop iterating when index is equal to text.length?

A: If we changed the loop condition on line 4 to: until index == text.length ,
this would work too.
=end

=begin
Q: Can you determine why we didn't use String#each_char or String#chars to
iterate through the string?

A: It's because we needed a way to compare each character of the string with
the character after by accessing their indices. Initializing two variables with
integer values is more straight-forward.
=end

=begin
Q: How would you update this method to use String#each_char or String#chars?

A: In my first solution I used String#chars successfully. I'm not so sure how
to solve this question with String#each_char.
=end
