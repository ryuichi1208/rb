num = 0
while num < 2 do
  print("num = ", num, "\n")
  num += 1
end
print("End\n")

num = 2
until num <= 0 do
  print("num = ", num)
  num = num - 1
end
print("End")

for num in 1..3 do
  print("num = ", num, "¥n")
end
print("End")

for n in 1..5 do
  print("n=",n,"\n")
end

print("18..20 is ¥n")
for num in 18..20 do
  print("num = ", num, "¥n")
end

print("18...20 is ¥n")
for num in 18...20 do
  print("num = ", num, "¥n")
end

range = 1..5
range.each { |c|
  puts c
}
