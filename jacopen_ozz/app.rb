require 'csv'

input = ARGV[0]
input ||= "STAY HUNGRY, STAY FOOLISH"

data = CSV.read("gutenberg.csv")

word_hash = {}

data.each_with_index do |line, row|
  line_words = ""
  line.each_with_index do |word, col|
    pointer = "#{row + 1},#{col + 1}"
    word_hash[word] ||= []
    word_hash[word].push pointer
  end
end

input.split(//).each do |word|
  pointer = word_hash[word].pop
  if pointer
    puts "#{pointer} = #{word}"
  else
    puts "cannot print!"
    exit
  end
end
