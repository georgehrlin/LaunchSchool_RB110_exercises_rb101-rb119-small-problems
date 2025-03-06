=begin
Mutation

What will the following code print, and why? Don't run the code until you have
tried to answer.
=end

array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = []
array1.each { |value| array2 << value }
array1.each { |value| value.upcase! if value.start_with?('C', 'S') }
puts array2

=begin
A:
The output will be:
Moe
Larry
CURLY
SHEMP
Harpo
CHICO
Groucho
Zeppo

Calling the destructive method #upcase! on some of the elements of array1
mutated those affected elements of the same values in array1 and in array2
because they are in fact the same objects.

Once line 3 appended every element of array1 to array2, array1 and array2 now
contained the same objects. (Suggested by Grok: Technically, array1 and array2
contain references to the same objects in memory.) Therefore, when some of them
are mutated by line 4, the mutations are reflected in array2.
=end

=begin
FURTHER EXPLORATION

How can this feature of Ruby get you in trouble? How can you avoid it?

A: There are scenarios in which this Ruby feature can be troublesome. For
instance, I may encounter two arrays that consist of references to different
objects but the objects have the same values. I could have assumed reflexively
that the elements are pointing to the same objects just because they "look" the
same.

Another tricky part of this feature (though this is more of an extension of it)
is there are different layers of reference. In this question, for example,
while array1 and array2 consist of the same references, they are, at the level
collections, different arrays.

One way to avoid such confusion is to have a good grasp on what truly gets
passed around in Ruby—references, and not thinking in terms of values getting
passed around.
=end
