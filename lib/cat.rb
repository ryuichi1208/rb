def cat(path)
  linenum = 0
  File.open(path, "r") do |f|
    linenum+=1
    f.each_line { |line|
      puts line
      puts linenum
  linenum+=1
    }
  end
end

cat ARGV[0]

a=0
