def tfidf(term, document, documents)
  puts "number_of_documents: #{documents.length}"
  puts "number_of_documents_with_term: #{documents.count { |d| tf(term, d) > 0}} "
  puts "Division is #{(documents.length).fdiv(documents.count { |d| tf(term, d) > 0})}"
  puts "tf: #{tf(term, document)}"
  puts "idf: #{idf(term, documents)}"
  (tf(term, document) * idf(term, documents)).round(1)
end

def tf(term, document)
  document.split(/[\s,.-]/).count { |word| word.downcase == term }
end

def idf(term, documents)
  number_of_documents = documents.length
  number_of_documents_with_term = documents.count { |d| tf(term, d) > 0}

  return 0.0 if number_of_documents_with_term == 0
  Math.log(number_of_documents.fdiv(number_of_documents_with_term))
end

# document1 = "Schrödinger's cat is a thought experiment often featured in discussions of the interpretation of quantum mechanics. The Austrian physicist Erwin Schrödinger devised " +
# "it in 1935 as an argument against the Copenhagen interpretation of quantum mechanics, which states that an object in a physical system can simultaneously exist in all possible configurations, " +
# "a state called quantum superposition, and only observing the system forces the object into just one of those possible states. Schrödinger disagreed with this interpretation. In particular, " +
# "quantum superposition could not work with larger objects. As an illustration, he presented a scenario with a cat in a sealed box, whose fate was linked to a subatomic event that may or may not occur. " +
# "In a quantum superposed state of the subatomic particles, the cat would be both alive and dead, until someone opened the box and observed it."

document2 = "The domestic cat is a small, furry, carnivorous mammal. The term cat can, however, also refer to wild cats, which include animals like lions, tigers and leopards. " +
"Cats are claimed to have a lower social IQ than dogs but can solve more difficult cognitive problems and have a longer-term memory. International Cat Day is celebrated on August 8. " +
"Famous cats include Schrödinger's cat as well as Pudding and Butterscotch, which occur in some of the Launch School assignments."

document3 = "One of the core values that sets Launch School apart from some other coding schools out there is our emphasis on Mastery-based Learning. If the key to becoming a competent and confident Software Engineer " +
"is deep understanding of first principles, then the key to acquiring that understanding is through Mastery-based Learning. The core of Mastery-based Learning is replacing time with mastery. There's no graduation, " +
"but a continual learning journey of micro-improvements. At Launch School, we're not trying to catch a wave or take advantage of a surge in demand. Instead, we're trying to focus on things that'll be useful to you for decades to come, " +
"such as a systematic problem-solving approach or learning how to deconstruct a programming language or building sound mental representations of how web application work. Everything we're trying to do at " +
"Launch School is with an eye towards sustainable studying habits and building skills for a long-term career."

documents = [document2, document3]

# puts tfidf("cat", document1, documents) # ~ 1.2
# puts tfidf("cat", document2, documents) # ~ 1.6
# puts tfidf("cat", document3, documents) # 0

# puts tfidf("quantum", document1, documents) # ~ 5.5
puts tfidf("quantum", document2, documents) # 0
puts tfidf("quantum", document3, documents) # 0

# puts tfidf("mastery", document1, documents) # 0
# puts tfidf("mastery", document2, documents) # 0
# puts tfidf("mastery", document3, documents) # ~ 4.4
# 
# puts tfidf("some", document1, documents) # 0
# puts tfidf("some", document2, documents) # ~ 0.4
# puts tfidf("some", document3, documents) # ~ 0.4

=begin
When I run the original code, of the four sets of examples, it is sets one and
four that produce wrong numbers. 0.0 is consistently returned as the wrong
value.

The method tfidf returns the product of the return values of the methods tf and
idf. For example sets one and four, the return value of idf is always 0.0,
causing a final tfidf return value of 0.0.

idf returns the logarithm of a quotient. The logarithm of 1 is 0. Line 26 is
faulty because the argument of Math.log is always an integer that has been
rounded down.
=end

=begin
FURTHER EXPLORATION

Once I removed document1 from the code, the last two examples using "quantum"
both output NaN. This is because, once document1 is removed with these two
examples, number_of_documents is still 2, but number_of_documents_with_term now
becomes 0, Math.log(0) then returns Infinity, tf returns 0, and 0 * Infinity
returns NaN.
=end
