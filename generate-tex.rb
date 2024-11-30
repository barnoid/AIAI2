#!/usr/bin/ruby

# Generates LaTeX source fo the novel
# On Debian the following packages are required to produce the PDF:
# texlive-latex-base texlive-latex-recommended texlive-latex-extra texlive-fonts-extra
# Then twice pdflatex <source>

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

print File.open('aiai.tex_start').read

chapters.each_index do |i|
  puts "\\chapter{#{chapter_titles[i].capitalize}}"
  puts chapters[i].gsub(/\n+/, "\\par\n").gsub(/---\\par/, "\\fancybreak{* * *}")
end

print File.open('aiai.tex_end').read
