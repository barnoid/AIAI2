#!/usr/bin/ruby

# Generates HTML pages per chapter including the images

chap = ARGV[0]

puts <<END
<html>
<head>
<title>AI AI agAIn - Chapter #{chap.to_i + 1}</title>
</head>
<body>
<h2>Chapter #{chap.to_i + 1}</h2>
END

Dir.glob("#{chap}-*.jpg").each do |img|
  base = File.basename(img, ".jpg")
  puts "<p style=\"font-size: small\">#{base}</p>"
  puts "<img src=\"#{img}\" />"
  if File.exist?(base + ".txt") then
    File.open(base + ".txt").each_line do |line|
      if line.chomp == "---" then
        puts "<hr/>"
      elsif line.size > 1 then
        puts "<p>#{line.chomp}</p>"
      end
    end
  end
end

puts <<END
</body>
</html>
END
