require 'csv'

input = ARGV[0]
data = CSV.read("gutenberg.csv")

row = 1

word_hash = {}

data.each do |line|
  col = 1

  line_words = ""
  line.each do |word|
    if word_hash[word]
      word_hash[word].push "#{row},#{col}"
    else
      word_hash[word] = ["#{row},#{col}"]
    end
    col += 1
  end
  row += 1
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
