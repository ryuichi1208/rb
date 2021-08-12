2.times do |n|
  puts n
end

r = 1..2
r.each { |c|
  puts c
}

print("3.times¥n")
3.times{|num|
  print("num = ", num, "¥n")
}

print("6.upto(8)¥n")
6.upto(8){|num|
  print("num = ", num, "¥n")
}

print("8.downto(6)¥n")
8.downto(6) do |num|
  print("num = ", num, "¥n")
end

num = 1
loop{
  print("num = ", num, "¥n")
  num += 1
  if num > 10 then
    break
  end
}

count = 1

("aa".."az").each{|str|
  print(str + "¥n");

  count += 1
  if count > 10 then
    break
  end
}

count = 0

("aa".."az").each{|str|
  count += 1
  if count % 3 != 0 then
    next
  end

  print(str + "¥n");
}
