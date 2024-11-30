#!/usr/bin/ruby

# Generates a markdown page of the entire novel

chapters = []
chapter_titles = []

Dir.glob("??.txt").each do |f|
  chapter = File.open(f).read
  chapter.gsub!(/\A\n+/m, "")
  chapter.gsub!(/\n\n\n+/, "\n\n")
  chapters << chapter

  if chapter.size < 6 then
    chapter_titles << "" 
    next
  end
  
  chapter_titles << chapter.split(' ').inject(Hash.new(0)) { |hash, word|
    word_fix = word.downcase.gsub(/[\.,;"]/, '')
    hash[word_fix] += 1 if word_fix.size > 7 and not chapter_titles.include?(word_fix)
    hash
  }.to_a.max_by { |pair| pair[1] }.first
end

puts "# A.I. A.I. agAIn"
puts "## by an A.I."
puts "## compiled by Barney Livingston"
puts

chapters.each_index do |i|
  puts "### Chapter #{i + 1} - #{chapter_titles[i].capitalize}"
  puts
  puts chapters[i]
  puts
end

