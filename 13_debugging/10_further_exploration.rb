=begin
FURTHER EXPLORATION

There's still one issue that could get us into trouble when performing
division. If you don't see it immediately, remove document1 from the documents
collection and check the TF-IDF value of 'quantum' again.
=end

require 'pry'

def tfidf(term, document, documents)
  tf(term, document) * idf(term, documents)
end

# Term frequency (simple version):
# the number of times a term occurs in a document

def tf(term, document)
  document.split(/[\s,.-]/).count { |word| word.downcase == term }
end

# Inverse document frequency:
# measure of how much information the word provides,
# based on the number of documents in which it occurs
# (the rarer it is, the more information it provides)

def idf(term, documents)
  number_of_documents = documents.length
  number_of_documents_with_term = documents.count { |d| tf(term, d) > 0 }
  return 0 if number_of_documents_with_term == 0
  quotient = number_of_documents.fdiv(number_of_documents_with_term)

  Math.log(quotient)
end

document1 = "Schrödinger's cat is a thought experiment often featured in discussions of the interpretation of quantum mechanics. The Austrian physicist Erwin Schrödinger devised " +
"it in 1935 as an argument against the Copenhagen interpretation of quantum mechanics, which states that an object in a physical system can simultaneously exist in all possible configurations, " +
"a state called quantum superposition, and only observing the system forces the object into just one of those possible states. Schrödinger disagreed with this interpretation. In particular, " +
"quantum superposition could not work with larger objects. As an illustration, he presented a scenario with a cat in a sealed box, whose fate was linked to a subatomic event that may or may not occur. " +
"In a quantum superposed state of the subatomic particles, the cat would be both alive and dead, until someone opened the box and observed it."

document2 = "The domestic cat is a small, furry, carnivorous mammal. The term cat can, however, also refer to wild cats, which include animals like lions, tigers and leopards. " +
"Cats are claimed to have a lower social IQ than dogs but can solve more difficult cognitive problems and have a longer-term memory. International Cat Day is celebrated on August 8. " +
"Famous cats include Schrödinger's cat as well as Pudding and Butterscotch, which occur in some of the Launch School assignments."

document3 = "One of the core values that sets Launch School apart from some other coding schools out there is our emphasis on Mastery-based Learning. If the key to becoming a competent and confident Software Engineer " +
"is deep understanding of first principles, then the key to acquiring that understanding is through Mastery-based Learning. The core of Mastery-based Learning is replacing time with mastery. There's no graduation, " +
"but a continual learning journey of micro-improvements. At Launch School, we're not trying to catch a wave or take advantage of a surge in demand. Instead, we're trying to focus on things that'll be useful to you for decades to come, " +
"such as a systematic problem-solving approach or learning how to deconstruct a programming language or building sound mental representations of how web application work. Everything we're trying to do at " +
"Launch School is with an eye towards sustainable studying habits and building skills for a long-term career."

documents = [document2, document3]

puts tfidf("quantum", document1, documents) # Faulty output: Infinity
puts tfidf("quantum", document2, documents) # Faulty output: NaN
puts tfidf("quantum", document3, documents) # Faulty output: NaN

=begin
Once document1 is removed from documents, the TF-IDF value of 'quantum' for
document 1 to 3 are respectively: Infinity, NaN, NaN. This is due to how the
method idf is structured. With the removal of document1,
number_of_documents_with_term always returns 0 for 'quantum'. Therefore,
quotient is always assigned Infinity, and thus Math.log(quotient) also returns
Inifnity.

Because idf("quantum", documents) always returns Inifnity, tfidf returns
Infinity if tf returns any value other than 0, or NaN if tf returns 0.
=end

# FIX
# idf shoud return 0.0 if number_of_documents_with_term is assigned 0
# I'm also using an updated approach in this new version of idf

def idf(term, documents)
  number_of_documents = documents.length
  number_of_documents_with_term = documents.count { |d| tf(term, d) > 0 }

  return 0.0 if number_of_documents_with_term == 0
  quotient = number_of_documents.fdiv(number_of_documents_with_term)

  Math.log(quotient)
end
