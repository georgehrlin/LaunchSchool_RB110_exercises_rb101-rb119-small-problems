words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon', 'lol']

anagrams = Hash.new { |hash, key| hash[key] = [] }
words.each { |word| anagrams[word.chars.sort.join] << word }
anagrams.values.each { |group| p group }
