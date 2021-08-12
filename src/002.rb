a = 30

if a == 30
  puts 20
end

puts 1 == 2
puts nil

if 1
  puts 1 == 1
end

num = 18
if num == 20 then
  print("num は 20 と等しい")
end

val = "Red"
redcolor = "Red"
if val == redcolor then
  print("col は Red です\n")
end

a = 30
b = 30 
c = 30

if a == b && b == c
  puts "ok"
end

if nil
  puts "ok"
elsif 1
  puts "ok2"
else
  puts "ng"
end

sum = 0
product = "Apple"

case product
when "Melon" then
  sum = sum + 500
when "Apple" then
  sum = sum + 150
end

print("料金は", sum, "です\n")

a = 1 ? 2 : 3
puts a

debug = 1
print("num = ", num) if debug
