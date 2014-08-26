# The beginning
require 'set'

words = Array.new

File.foreach('./data/words.txt').map { |word| words.push(word) }

index = Hash.new

def tokenize_string(str)
  result = []
  chas = str.split("")
  len = chas.size
  (0..len-1).each do |i|
    (i..len-1).each do |j|
      result.push(chas[i..j].join)
    end
  end
  result.uniq
end

words.each do |word|
  puts word
  tokens = tokenize_string(word)
  tokens.each do |token|
    index[token] = Set.new unless index.has_key? token
    index[token] = index[token].add(word)
  end
end
